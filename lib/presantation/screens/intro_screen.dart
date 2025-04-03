import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepProgressForm  extends StatefulWidget{
  const StepProgressForm({super.key});

  @override
  _StepProgressFormState createState()  => _StepProgressFormState();
    
}

class _StepProgressFormState extends State<StepProgressForm> {

  int currentStep = 1;
  int totalStep = 5;
    final ageController = TextEditingController();
    final weightController = TextEditingController();
    final heightController = TextEditingController();

    final PageController pageController = PageController();

    void nextStep()
    {
      if(currentStep < totalStep){
        setState(() {
          currentStep ++;

        });
        pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceOut);
      }
    }
    void previousStep()
    {
      if(currentStep > 0)
      {
        setState(() {
          currentStep --;
        });
        pageController.previousPage(duration: Duration(microseconds: 300), curve: Curves.easeInCirc);

      }
    }
    Widget buildStepPage(String labelText,TextEditingController controller)
    {
      return Center(
        child:  Padding(padding:EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(labelText,style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 20,),
            TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(border:OutlineInputBorder(),labelText: labelText),
            )
          ],
        ),),

      );
    }
    Widget buildStepProgress(int currentStep)
    {
      return Row(
        children: List.generate(totalStep, (index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            height: 15,
            width: 30,
            decoration: BoxDecoration(shape: BoxShape.circle,color: index <= currentStep ?const Color.fromARGB(255, 38, 35, 226) :Color.fromARGB(255, 181, 181, 228))
          );
        }),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.only(left: 80,right: 80,top: 40),
        child: Column(
          
          children: [
            Container(
              child: Row(
                children: [
                   IconButton(onPressed: (){previousStep();}, icon: Icon(FontAwesomeIcons.angleLeft,color: const Color.fromARGB(255, 61, 60, 95) ,)),
                   SizedBox(child: buildStepProgress(currentStep)),
                  IconButton(onPressed: (){nextStep();}, icon: Icon(FontAwesomeIcons.angleRight,color: const Color.fromARGB(255, 78, 77, 122) ,)),
                ],
              ),
            ),
            Expanded(child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildStepPage("Yaşınız?", TextEditingController()),
                buildStepPage("Kilo?", TextEditingController()),
                buildStepPage("Boy?", TextEditingController()),


              
              ],

            ))

          ],
        ),
      ),
      
    );

  }




}