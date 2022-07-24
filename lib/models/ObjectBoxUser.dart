// ignore_for_file: file_names
import "package:objectbox/objectbox.dart";

@Entity()
class ObjectBoxUser {

  int id = 0;
  String userEmail;
  String userPassword;
  
  ObjectBoxUser({ required this.userEmail , required this.userPassword });
}
