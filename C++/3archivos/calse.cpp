#include<iostream>
#include<stdlib.h>
using namespace std;

class Estudiante{ //clase estudiante
    private:
        //atributos
        string nombre; 
        int edad; 
        int notas[3];

    public:
        //constructor
        Estudiante(string nombre1,int edad1,int nota0, int nota1, int nota2){
        nombre = nombre1;
        edad = edad1;
        notas[0] = nota0;
        notas[1] = nota1;
        notas[2] = nota2;
        
        }
        //generador de promedio 
        float promedio(){
            float suma = notas[0] + notas[1] + notas[2];
            suma = (suma/3);
            return suma;
        }

        string getNombre(){
            return nombre;
        }
        int getEdad(){
            return edad;
        }
        void getNotas(){
            cout<<"sus notas son: ";cout<<"\n";
            for (int i = 0; i < 3; i++)
            {
                cout<<notas[i]<<"\n";
            }
            
        }
 
        void getData(){
            cout<<"nombre: ";cout<<getNombre();cout<<"\n";
            cout<<"edad: ";cout<<getEdad();cout<<"\n";
            getNotas();cout<<"\n";
        }
};

int main(){
    //crear estudiante de ejemplo
    string nombre;
    int edad;
    int notas[3];
    cout<< "Ingrese el nombre del estudiante: "; cin>>nombre;
    cout<< "Ingrese la edad del estudiante: "; cin>>edad;
    cout<< "ingrese las notas";cout<<"\n";
    for (int i = 0; i < 3; i++)
    {
        cout<< "nota "; cout<< (i+1); cout<<": ";cin>>notas[i];
    }

    Estudiante estudiante1(nombre,edad,notas[0],notas[1],notas[2]);
    cout<<"su promedio es de: ";cout<< estudiante1.promedio();
    

};