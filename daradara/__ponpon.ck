1000::ms => dur T;
T - (now % T) => now;

SndBuf hihat => Gain g => dac;
"data/snare-hop.wav" => hihat.read;
0 => hihat.gain;
.8 => g.gain;

fun void play(SndBuf b) {
    0 => b.pos;
    .4 => b.gain;
}
fun void stop(float i)
{
    T * i => now;
};

while(true) {
    stop(7);
    play(hihat);
    stop(.5);
    play(hihat);
    stop(.5);
}
