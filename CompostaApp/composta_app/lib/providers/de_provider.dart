

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

 Future<Database> get database async {
   
   //Regresar la misma base  de datos
   if(_database!=null) return _database;

   //Si es la primera ves creamos la base de datos
   _database = await initDB();

   return _database;

  }

  Future<Database> initDB() async{
    //Ruta en donde almacenamos la base de datos dentro del dispositivo
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'dbComposta.db');
    print(path);

    //Crear base de datos
    return await openDatabase(
      path,
      //Incrementar cuando se realicen cambios
      version: 2,
      onOpen: (db) {},
      onCreate: (Database db, int version) async{
          await db.execute('''
          CREATE TABLE `categoria` (
          `idCategoria` int(11) NOT NULL,
          `nombre` varchar(45) NOT NULL,
          `observaciones` text NOT NULL
        );

          ALTER TABLE `categoria`
            ADD PRIMARY KEY (`idCategoria`);

          ALTER TABLE `categoria`
            MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

           CREATE TABLE `composta` (
          `idComposta` int(11) NOT NULL,
          `peso_Total` float(6,2)	 NOT NULL,
          `n_Total` float(6,2) NOT NULL,
          `c_Total` float(6,2) NOT NULL,
          `h2o_Total` float(6,2) NOT NULL,
          `c_n` float(6,2) NOT NULL,
          `nombre` varchar(45) NOT NULL,
          `fecha_inicial` date NOT NULL,
          `tipo` varchar(45) NOT NULL
           ); 

            ALTER TABLE `composta`
              ADD PRIMARY KEY (`idComposta`);

            ALTER TABLE `composta`
              MODIFY `idComposta` int(11) NOT NULL AUTO_INCREMENT;

            CREATE TABLE `registro` (
           `fecha` date NOT NULL,
           `temperatura` float(6,2) NOT NULL,
           `humedad` float(6,2) NOT NULL,
           `ph` float(6,2) NOT NULL,
           `composta_idComposta` int(11) NOT NULL
            );


           ALTER TABLE `registro`
           ADD CONSTRAINT `composta_idComposta` FOREIGN KEY (`composta_idComposta`) REFERENCES `composta` (`idComposta`);


              CREATE TABLE `residuo` (
              `idResiduo` int(11) NOT NULL,
              `material` varchar(45) NOT NULL,
              `porcentaje_N` float(6,2) NOT NULL,
              `porcentaje_C` float(6,2) NOT NULL,
              `porcentaje_H2o` float(6,2) NOT NULL,
              `peso` float(6,2) NOT NULL,
              `n_Calculado` float(6,2) NOT NULL,
              `h_Calculado` float(6,2) NOT NULL,
              `h2o_calculado` float(6,2) NOT NULL,
              `categoria_idCategoria` int(11) NOT NULL
            );

            ALTER TABLE `residuo`
            ADD PRIMARY KEY (`idResiduo`);

            ALTER TABLE `residuo`
            MODIFY `idResiduo` int(11) NOT NULL AUTO_INCREMENT;
            
            ALTER TABLE `residuo`
            ADD CONSTRAINT `categoria_idCategoria` FOREIGN KEY (`categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`);

            CREATE TABLE `relacion_residuo_composta` (
            `composta_idComposta` int(11) NOT NULL,
            `residuo_idResiduo` int(11) NOT NULL
             );

          ALTER TABLE `relacion_residuo_composta`
            ADD CONSTRAINT `composta_idCompostaa` FOREIGN KEY (`composta_idComposta`) REFERENCES `composta` (`idComposta`);
          ALTER TABLE `relacion_residuo_composta`
            ADD CONSTRAINT `residuo_idResiduo` FOREIGN KEY (`residuo_idResiduo`) REFERENCES `residuo` (`idResiduo`);

          ''');
          print("Tabla creada correctamente Version3");
      }
    );
  }

}