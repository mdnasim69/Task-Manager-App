import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';

class Progresstaskscreen extends StatefulWidget {
  const Progresstaskscreen({super.key});

  @override
  State<Progresstaskscreen> createState() => _ProgresstaskscreenState();
}

class _ProgresstaskscreenState extends State<Progresstaskscreen> {
  List TaskItem = [];
  bool Loading = true;

  callData() async {
    var List = await TaskListReqest('Progress');
    setState(() {
      Loading = false;
      TaskItem = List;
    });
  }

  @override
  void initState() {
    callData();
    super.initState();
  }

DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {Loading=true;});
                await TaskDeletReqest(id);
                await callData();
              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),
            ],
          );
        }
    );
  }

 String status = 'Progress';

  editStatus(id) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 350,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioListTile(
                  title: Text('New'),
                  value: 'New',
                  groupValue: status,
                  onChanged: (value) {
                    setState(
                      () {
                        status = value.toString();
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: Text('progress'),
                  value: 'Progress',
                  groupValue: status,
                  onChanged: (value) {
                    setState(
                      () {
                        status = value.toString();
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: Text('Completed'),
                  value: 'Completed',
                  groupValue: status,
                  onChanged: (value) {
                    setState(
                      () {
                        status = value.toString();
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: Text('Canceled'),
                  value: 'Canceled',
                  groupValue: status,
                  onChanged: (value) {
                    setState(
                      () {
                        status = value.toString();
                      },
                    );
                  },
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.of(context).pop();
                      setState(() {
                      Loading = true;
                      });
                      ChengeStatus(id);},
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Confirm',
                      style: textstyle(16, FontWeight.w400, Colors.white),
                    ),
                    style: AppButton(),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

ChengeStatus(id) async {
    await TaskStatusReqest(id, status);
    await callData();
    setState(() {
      status='Progress';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (const Center(
            child: CircularProgressIndicator(),
          ))
        : RefreshIndicator(
            child:TaskListView(TaskItem,DeleteItem,editStatus),
            onRefresh: () async {
              callData();
            },
          );
  }
}
