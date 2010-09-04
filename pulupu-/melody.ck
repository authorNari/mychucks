// this synchronizes to period
400::ms => dur T;
T - (now % T) => now;
Flute flute => PoleZero f  => JCRev r  => dac;
.05 => r.mix;
.99 => f.blockZero;

fun void play(StkInstrument stk, float feq, float noteOn, float i)
{
    Std.mtof(feq) => stk.freq;
    .2 => stk.noteOn;
    T * i => now;
    0 => stk.noteOn;
};

fun void stop(float i)
{
    T * i => now;
};

fun void f_play(float feq, float i)
{
    play(flute, feq, .2, i);
};

fun void v_play(float feq, float i)
{
    BeeThree voc => JCRev r => dac;
    .05 => r.mix;
    play(voc, feq, 0.4, i);
};

fun void maj7(int root, float i) {
    spork ~ v_play(root, i);    // Root
    spork ~ v_play(root+4, i);  // M3
    spork ~ v_play(root+7, i);  // P5
    v_play(root+11, i);         // M7
}

fun void base(int root)
{
    root-36 @=> int base_root;
    maj7(base_root, 6);
    maj7(base_root-5, 2);
    maj7(base_root-3, 6);
    stop(3);

    maj7(base_root, 6);
    maj7(base_root+7, 2);
    maj7(base_root+9, 4);
    stop(2);

    maj7(base_root+9, 2);
    maj7(base_root+12, 6);
    maj7(base_root+7, 2);
    maj7(base_root+9, 4);
    stop(2);

    maj7(base_root+9, 2);
    maj7(base_root+7, 6);
    maj7(base_root+7, 1);
    maj7(base_root+5, 1);
    maj7(base_root+7, 6);
};

int base2_ck_1;

fun void main_melody(int level)
{
    73 @=> int root;
    if (level > 0) {
        Machine.add( "base2.ck" ) => base2_ck_1;
        spork ~ base(root);
    }
    f_play(root, 0.5);
    f_play(root + 2, 0.5);
    f_play(root, 3);
    f_play(root - 1, 2);
    f_play(root - 5, 2);
    f_play(root - 3, 0.5);
    f_play(root - 1, 0.5);
    f_play(root - 3, 4);
    stop(4);

    f_play(root, 0.5);
    f_play(root + 2, 0.5);
    f_play(root, 3);
    f_play(root - 1, 2);
    f_play(root + 7, 2);
    f_play(root + 9, 0.5);
    f_play(root + 11, 0.5);
    f_play(root + 9, 5);

    f_play(root + 9, 0.5);
    f_play(root + 11, 1);
    f_play(root + 12, 3.5);
    f_play(root + 14, 0.5);
    f_play(root + 12, 0.5);
    f_play(root + 11, 2);
    f_play(root + 7, 2);
    f_play(root + 9, 0.5);
    f_play(root + 11, 0.5);
    f_play(root + 9, 5);

    f_play(root + 11, 0.5);
    f_play(root + 9, 1);
    f_play(root + 7, 7);

    f_play(root + 5, 1);
    f_play(root + 7, 6);
    stop(4);
}

Machine.add( "base.ck" ) => int base_ck;
stop(8);
Machine.add( "base2.ck" ) => int base2_ck;
main_melody(0);
main_melody(1);
Machine.remove(base2_ck);
Machine.remove(base2_ck_1);
Machine.remove(base_ck);
