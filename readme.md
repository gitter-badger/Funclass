Funclass est un projet personnel. Il s'agit d'un mini-langage de programmation qui n'a pas pour but d'être utilisé à grande échelle.

Ce langage proposera une syntaxe claire. Dans un premier temps, seules les fonctions les plus basiques seront implémentées pour pouvoir, au final, si possible, implémenter de l'objet.

# Compilation
Fichier `compile.hxml` :

    -main Funclass
    -neko funclass.n

Compilation et exécution :

    haxe compile.hxml
    neko funclass.n

# Syntaxe
## Types
* nombres
* chaînes

## Affectation
    a = 6
    b = a + 12
    c = "Hello!"

## Fonction
    func add(a, b) do
      # code
      return a + b
    end
    
    life = add(40, 2)

## Condition
    if condition then
      # code
    elsif condition then
      # code
    else
      # code
    end

## Boucle
    while condition do
      # code
    end

# Tests
    <, >, <=, >=, ==, <>
    and or

## Calculs
    + - * / % ^
