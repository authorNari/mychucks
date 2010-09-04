400::ms => dur T;
T - (now % T) => now;

SndBuf kick => Gain g_kick => dac;
"data/kick.wav" => kick.read;
0 => kick.gain;
.5 => g_kick.gain;

SndBuf buf => Gain g => dac;
"data/hihat-open.wav" => buf.read;
0 => buf.gain;
.5 => g.gain;

SndBuf buf2 => Gain g2 => dac;
"data/snare.wav" => buf2.read;
0 => buf2.gain;
.5 => g2.gain;

fun void play(SndBuf b) {
    0 => b.pos;
    .4 => b.gain;
}
fun void stop(float i)
{
    T * i => now;
};

while(true) {
    play(kick);
    stop(.5);
    play(kick);
    stop(.5);
    play(kick);
    stop(.5);
    play(buf2);
    stop(.5);
    play(buf);
    stop(2);
}
