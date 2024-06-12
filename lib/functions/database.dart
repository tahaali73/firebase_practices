import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Create(String collecname, docname, name, animal, int age )async{
  await FirebaseFirestore.instance.collection(collecname).doc(docname).set({
    'name': name,
    'animal': animal,
    'age': age
  });
  print('Datbase updated');
}

update(String collecname, docname, field, var newFieldValue)async{
  await FirebaseFirestore.instance.collection(collecname).doc(docname).update({field: newFieldValue});
print('fields updated');
}

delete(String collecname, docname)async{
  await FirebaseFirestore.instance.collection(collecname).doc(docname).delete();
  print('document deleted');
}
