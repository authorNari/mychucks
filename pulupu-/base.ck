400::ms => dur T;
T - (now % T) => now;

SndBuf buf => Gain g => dac;
"data/hihat.wav" => buf.read;
.5 => g.gain;

fun void play() {
    0 => buf.pos;
    .4 => buf.gain;
    T*2 => now;
}

while(true) {
    play();
}
