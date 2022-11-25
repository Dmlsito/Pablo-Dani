package org.example;
import org.bson.Document;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import java.util.ArrayList;
import java.util.List;
import static com.mongodb.client.model.Filters.eq;

public class EmpleadoCRUD {

    //Funcion de parseo de datos de objeto empleado a documento
    private static Document empleadoAdocumento(Empleado empleado){
        Document document = null;

        if(empleado != null){
            //Cuando ya sabemos que el objeto empleado tiene datos instanciamos un objeto document
            document = new Document();
            //Agregamos los datos del empleado al objeto documento
            document.put("Nombre", empleado.getNombre());
            document.put("Edad", empleado.getEdad());
            document.put("ContratoFijo", empleado.getContratoFijo());
            document.put("Alta", empleado.getAlta());
            document.put("Sueldo", empleado.getSueldo());
        }
        return document;

    }
    //Funcion de parseo de documento a empleado

    private static Empleado documentoAEmpleado(Document document){
         Empleado empleado = null;

        if(document != null){
            empleado = new Empleado();
            empleado.setNombre(document.getString("Nombre"));
            empleado.setEdad(document.getInteger("Edad"));
            empleado.setSueldo(document.getDouble("Sueldo"));
            empleado.setContratoFijo(document.getBoolean("ContratoFijo"));
            empleado.setAlta(document.getString("Alta"));

        }
        return empleado;
    }

    //Operacion listar

     static List<Empleado> listarEmpleados(MongoCollection<Document> colMongo){
        //Creamos un objeto empleado para ir almacenando datos en el
        Empleado empleado;

        //Creamos la lista en donde se guardaran los datos de todos los empleados
        List<Empleado> listaEmpleados = new ArrayList<Empleado>();

        //Lista en donde se guardaran todos los documentos que contenga la BBDD
        List <Document> documentos = colMongo.find().into(new ArrayList<Document>());

        for(Document documento: documentos){
            //Recogemos en el objeto que hemos creado al principio de la funcion los datos del empleado, y lo parseamos
            empleado = documentoAEmpleado(documento);

            //Añadimos el empleado a la lista de empleados
            listaEmpleados.add(empleado);
        }
        return listaEmpleados;
    }

    //Operacion eleminar
     static void eliminarEmpleado(MongoCollection<Document> colMongo, String nombre){

        try{
            colMongo.deleteOne(Filters.eq("Nombre", nombre));
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    //Operacion update
     static void actualizarEmpleado(MongoCollection <Document> colMongo, Empleado empleado){
        //Lo primero que tenemos que hacer es convertir al objeto empleado en un objeto documento para poder insertarlo en la BBDD
        Document document = empleadoAdocumento(empleado);

        try{
            //Indicamos que se reemplace el documento que tenga como valor en el campo Nombre el valor del nombre del empleado que queremos actualizar
            colMongo.replaceOne(Filters.eq("Nombre", empleado.getNombre()), document);
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    //Operacion consulta
     static Empleado consultarEmpleado(String nombre, MongoCollection <Document> colMongo){

          Document document = colMongo.find(eq("Nombre", nombre)).first();

          //Como tenemos el parseador le podemos retornar directamente esta funcion que a su vez retorna un objeto empleado
          return documentoAEmpleado(document);

    }

    //Operacion insert

     static void insertarEmpleado(Empleado empleado, MongoCollection<Document> colMongo){

        Document document = empleadoAdocumento(empleado);

        try{
            //Primero de todo debemos comprobar si ese empleado ya esta en la BBDD
            if(consultarEmpleado(empleado.getNombre(), colMongo) == null){
                //Si no existe insertamos el documento
              colMongo.insertOne(document);
            }else{
                System.out.println("ERROR, el empleado " + empleado.getNombre() + " ya existe en la BBDD");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }


}
