package org.example;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import com.mongodb.client.MongoDatabase;

import java.util.List;


public class Main extends EmpleadoCRUD
{
    public static void main ( String[] args )
    {

        MongoClient cliente = null;

        try{
            //Creamos la conexion a la BBDD
            cliente = new MongoClient("localhost", 27017);
            MongoDatabase conexion = cliente.getDatabase("Empresa");
            MongoCollection<Document> colMongo = conexion.getCollection("Empleados");

            //Insert de varios empleados en la BBDD
            Empleado empleado1 = new Empleado("Paco", 30, false, "05/11/2002", 1005.32);
            insertarEmpleado(empleado1, colMongo);
            Empleado empleado2 = new Empleado("Daniel", 18, true, "05/11/2002", 1500.32);
            insertarEmpleado(empleado2, colMongo);
            Empleado empleado3 = new Empleado("Marcos", 54, true, "05/11/2002", 3000.32);
            insertarEmpleado(empleado3, colMongo);

            //Listamos los empleados insertados previamente en la BBDD
            List<Empleado> listaEmpleados = listarEmpleados(colMongo);

            System.out.println("Lista de empleados: \n");

            for(Empleado empleado: listaEmpleados){
                System.out.println( empleado.toString());
            }

            //Actualizamos varios empleados

            empleado1.setContratoFijo(true);
            actualizarEmpleado(colMongo, empleado1);

            empleado2.setContratoFijo(false);
            actualizarEmpleado(colMongo, empleado2);

            //Consultamos para ver si la actualizacion se ha realizado con exito

            Empleado empleadoConsultado1 = consultarEmpleado("Paco", colMongo);
            System.out.println("Empleado -> " + empleadoConsultado1.toString() + "\n");
            Empleado empleadoConsultado2 = consultarEmpleado("Daniel", colMongo);
            System.out.println("Empleado -> " + empleadoConsultado2.toString());

            //Eliminamos un empleado

            eliminarEmpleado(colMongo, "Paco");

            //Listamos todos los empleados de la base de datos

            listaEmpleados = listarEmpleados(colMongo);
            System.out.println("Lista de empleados actualizada -> \n");

            for(Empleado empleado: listaEmpleados){
                System.out.println( empleado.toString());
            }

        }
        finally {
            if (cliente != null){
                cliente.close();
            }
        }




    }
}
