1000::ms => dur T;
T - (now % T) => now;

SndBuf kick => Gain g_kick => dac;
"data/kick.wav" => kick.read;
0 => kick.gain;
.8 => g_kick.gain;

SndBuf hihat_o => Gain g => dac;
"data/hihat-open.wav" => hihat_o.read;
0 => hihat_o.gain;
.8 => g.gain;

SndBuf snare => Gain g2 => dac;
"data/snare.wav" => snare.read;
0 => snare.gain;
.8 => g2.gain;

fun void play(SndBuf b) {
    0 => b.pos;
    .4 => b.gain;
}
fun void stop(float i)
{
    T * i => now;
};

while(true) {
    stop(.5);
    play(hihat_o);
    stop(.5);
    play(hihat_o);
    stop(1);
}
