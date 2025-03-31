int: owoce = 215;
int: frytki = 275;
int: salatka = 335;
int: skrzydelka = 355;
int: paluszki = 420;
int: zestaw_probny = 580;
int: suma = 1505;

var 0..10: o; % liczba owoców
var 0..10: f; % liczba frytek
var 0..10: s; % liczba sałatek
var 0..10: sk; % liczba skrzydełek
var 0..10: p; % liczba paluszków
var 0..10: z; % liczba zestawów próbnych

constraint o * owoce +
           f * frytki +
           s * salatka +
           sk * skrzydelka +
           p * paluszki +
           z * zestaw_probny == suma;

solve satisfy;