1000::ms => dur T;
T - (now % T) => now;

ModalBar stk => PoleZero f  => Gain g => JCRev r => dac;
.5 => r.mix;
.9 => f.blockZero;
dur allTime;
1 => stk.volume;

fun void play(float feq, float i)
{
    Std.mtof(feq) => stk.freq;
    .9 => stk.noteOn;
    T * i => now;
    allTime + (T * i) => allTime;
    0 => stk.noteOn;
};

fun void stop(float i)
{
    T * i => now;
    allTime + (T * i) => allTime;
};

fun void wait_to_frame_end()
{
    T - (allTime % T) => now;
    0::ms => allTime;
};

59 @=> int root;
while(true) {
    play(root+8, .3);
    stop(.45);
    play(root+8, .125);
    play(root+9, .125);
    play(root+8, .125);
    play(root+9, .125);
    play(root+8, .125);
    play(root+9, .125);
    play(root+8, .125);
    play(root+9, .125);
    play(root+10, .1);
    wait_to_frame_end();
    play(root+10, .3);
    stop(.45);
    play(root+10, .125);
    play(root+12, .125);
    play(root+10, .125);
    play(root+12, .125);
    play(root+10, .125);
    play(root+12, .125);
    play(root+10, .125);
    play(root+12, .125);
    play(root+13, .1);
    wait_to_frame_end();
    play(root+12, .3);
    stop(.45);
    play(root+12, .125);
    play(root+14, .125);
    play(root+12, .125);
    play(root+14, .125);
    play(root+12, .125);
    play(root+14, .125);
    play(root+12, .125);
    play(root+14, .125);
    play(root+12, .125);
    play(root+14, .125);
    play(root+12, .125);
    play(root+15, .2);
    wait_to_frame_end();
    stop(1);
};
