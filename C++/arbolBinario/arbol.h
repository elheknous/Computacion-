#include<iostream>
#include<conio.h>
#include<stdlib.h>
using namespace std;

//Estructura del nodo
struct Nodo{
    int dato;
    Nodo *der;
    Nodo *izq;

};

Nodo *arbol = NULL;

//Funciones
void menu(); // Menu de usuario
Nodo *crearNodo(int); // Creacion de nodos
void insertarNodo(Nodo *&,int); //Insertar Nodos en el arbol
void mostrarArbol(Nodo *,int); // Mostrar arbol
