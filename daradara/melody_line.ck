1000::ms => dur T;
T - (now % T) => now;

Moog mg => PoleZero f => Gain g => JCRev r  => dac;
g => Gain feedback => DelayL delay => g;
.05 => r.mix;
.9 => f.blockZero;
dur allTime;
.9 => mg.vibratoFreq;
.9 => mg.afterTouch;

fun void play(float feq, float i)
{
    .5 => mg.noteOn;
    Std.mtof(feq) => mg.freq;
    T * i => now;
};

fun void stop(float i)
{
    0 => mg.noteOn;
    T * i => now;
};

59 @=> int root;
while(true) {
    play(root, 2);
    play(root+2, 2);
    play(root+4, 3);
    stop(1);
    play(root, 2);
    play(root-2, 2);
    play(root-5, 3);
    stop(1);
    play(root-5, 2);
    play(root-2, 2);
    play(root-5, 3);
    stop(1);
};
