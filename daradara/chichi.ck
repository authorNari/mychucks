1000::ms => dur T;
T - (now % T) => now;

SndBuf snare => Gain g2 => dac;
"data/hihat.wav" => snare.read;
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
    play(snare);
    stop(.25);
}
