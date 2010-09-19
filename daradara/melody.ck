1000::ms => dur T;
T - (now % T) => now;

fun void stop(float i)
{
    T * i => now;
};

Machine.add("puecho.ck") => int pucho;
stop(8);
Machine.add("melody_line.ck") => int melody_line;
stop(7);
Machine.add("kick.ck") => int kick;
stop(1);
Machine.add("__ponpon.ck") => int __ponpon;
stop(8);
Machine.add("chichi.ck") => int chichi;
Machine.add("tantan.ck") => int tantan;
stop(8);
Machine.add("voice.ck") => int voice;
stop(8*3);
Machine.remove(voice);
Machine.remove(melody_line);
Machine.remove(tantan);
Machine.remove(kick);
stop(7);
Machine.remove(chichi);
stop(9);
Machine.remove(pucho);
stop(3);
Machine.remove(__ponpon);
