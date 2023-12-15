import 'package:flutte_gym_app/Models/exercise_model.dart';
import 'package:flutte_gym_app/Models/feeling_model.dart';
import 'package:flutter/material.dart';

class exercise_view extends StatelessWidget {
  exercise_view({super.key});

  final ExerciseModel = exerciseModel(
    id: "EX001", 
    name: "Remada alta supinada", 
    treino: "Treino A", 
    comoFazer: "Segura a barra e puxa"
  );

  final List<feelingModel> feelingList = [
    feelingModel(id: "SE001", feeling: "pouca ativação hoje", date: "20220-07-12"),
    feelingModel(id: "SE002", feeling: "senti mais ativação hoje", date: "20220-07-13"),
    feelingModel(id: "SE002", feeling: "senti mais ativação hoje", date: "20220-07-13"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 198, 144),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              ExerciseModel.name, 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ), 
            Text(
              ExerciseModel.treino,
              style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 145, 100),
        elevation: 0,
        toolbarHeight: 62,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18)
            )
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi clicado!");
        },
        child: const Icon(Icons.add), 
      ),
      body: 
      Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton( 
                    onPressed: () {},
                    child: const Text("Enviar Foto"),
                    ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Tirar Foto"))
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text("Como Fazer?", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
              Text(
                  ExerciseModel.comoFazer
                ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Divider(color: Colors.black,),
              ),
              const Text("Como Estou me sentindo?", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(feelingList.length, (index){
                  feelingModel feelingNow = feelingList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(feelingNow.feeling), 
                    subtitle: Text(feelingNow.date),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete, color: Colors.red,), onPressed: () {
                          print("DELETAR ${feelingNow.feeling}");
                      },
                    ),
                  );
                }),
              )
          ],
        ),
      ),
    );
  }
}