 int: nodesNumber;
int: minColorsNumber;
array[1..nodesNumber, 1..nodesNumber] of bool: edges;

% Deklaracja maxClique – indeksowana dynamicznie, jak w .dzn
array[int] of int: maxClique;

array[1..nodesNumber] of var 1..nodesNumber: nodes;
var 1..nodesNumber: colorsNumber;

% Każdy węzeł ma przypisany kolor, a colorsNumber to maksymalny kolor użyty
constraint colorsNumber = max(nodes);

% Sąsiadujące węzły muszą mieć różne kolory
constraint forall(i, j in 1..nodesNumber where edges[i, j]) (
  nodes[i] != nodes[j]
);

% Łamanie symetrii – wymusza przypisanie pierwszym wierzchołkom unikalnych kolorów
constraint forall(i in 1..minColorsNumber) (
  nodes[i] = i
);

% Jeśli chcesz wymusić, że maxClique to rzeczywista klika z różnymi kolorami
constraint forall(i, j in index_set(maxClique) where i < j) (
  nodes[maxClique[i]] != nodes[maxClique[j]]
);

solve minimize colorsNumber;

output [
  "colorsNumber = \(colorsNumber)\n",
  "nodes = \(nodes)\n"
];