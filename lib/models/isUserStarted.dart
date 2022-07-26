// ignore_for_file: file_names
import "package:objectbox/objectbox.dart";


@Entity()
class IsUserStarted {
  int id = 0;
  bool userStarted;

  IsUserStarted({required this.userStarted});
}
