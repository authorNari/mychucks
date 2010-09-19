1000::ms => dur T;
T - (now % T) => now;

SinOsc sin => PoleZero f  => Gain g => JCRev r  => dac;
g => Gain feedback => DelayL delay => g;
.05 => r.mix;
.9 => f.blockZero;
dur allTime;
.75::second => delay.max => delay.delay;
.5 => feedback.gain;
.75 => delay.gain;

fun void play(float feq, float i)
{
    Std.mtof(feq) => sin.freq;
    T * i => now;
    allTime + (T * i) => allTime;
    0 => sin.freq;
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
    play(root+8, .1);
    wait_to_frame_end();
    stop(1);
    play(root+10, .1);
    wait_to_frame_end();
    stop(1);
    play(root+12, .1);
    wait_to_frame_end();
    stop(1);
    stop(1);
    stop(1);
};
