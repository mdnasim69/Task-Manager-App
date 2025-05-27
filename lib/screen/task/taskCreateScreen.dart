import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';

class Taskcreatescreen extends StatefulWidget {
  const Taskcreatescreen({super.key});

  @override
  State<Taskcreatescreen> createState() => _TaskcreatescreenState();
}

class _TaskcreatescreenState extends State<Taskcreatescreen> {

Map FormValue ={
    "title":"",
    "description":"",
    "status":"New"
};
bool Loading =false;

onChenge(key,value){
  FormValue.update(key, (update)=>value);
}


 onSubmit() async {
    if (FormValue['title']!.length == 0) {
      ErrorToast('Enter your title');
    } else if (FormValue['description']!.length == 0) {
      ErrorToast('Enter your description');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await TaskCreateReqest(FormValue);
      if (res == true) {
        Navigator.pushNamed(
            context, '/home');
        //navigation
      }
    }
    setState(() {
      Loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundPicture(context),
          Container(
            alignment: Alignment.center,
            child: Loading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : (SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Create Your Task',
                            style:
                                textstyle(34, FontWeight.w700, Colors.black)),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Developer Nasim',
                          style: textstyle(20, FontWeight.normal, Colors.grey),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: AppInputDecoration('title'),
                          onChanged: (value) {
                            onChenge('title',value);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(maxLines:8,
                          decoration: AppInputDecoration('description'),
                          onChanged: (value) {
                            onChenge( 'description',value);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              onSubmit();
                            },
                            // ignore: sort_child_properties_last
                            child: Text(
                              'Create',
                              style:
                                  textstyle(16, FontWeight.w400, Colors.white),
                            ),
                            style: AppButton(),
                          ),
                        ),
                       ],
                    ),
                  )),
          ),
        ],
      ),
      appBar:AppBar(backgroundColor:Colors.yellow,),
    );
  
  }
}