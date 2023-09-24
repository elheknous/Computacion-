#include <iostream>
using namespace std;

int main(){
    int numero;
    cout<<"Ingrese numero: "; //IMPRIMIR DATOS
    cin>>numero;  //INGRESAR DATOS
    cout<<numero;

    double a = 12.323321;
    cout.precision(2); // NUMERO DE DIGITOS QUE SE DESEAN INCLUYENDO LA PARTE ENTERA
    cout<<a;

    if(a>12){
        cout<<"true";
    
    }else{
        cout<<"false";
    }

    return 0;
}

