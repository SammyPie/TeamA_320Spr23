import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_application_1/login_page.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left)),
        //title: Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
        //actions: [IconButton(onPressed: (){}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
        title: const Text("UScheduler"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /*
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), child: const Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/0a/UMass_primary_logo.png')),
                ),
              ),
              */
              const SizedBox(height: 10),
              Text("Welcome!", style: Theme.of(context).textTheme.headlineMedium),
              Icon(Icons.email,color: Colors.grey[400]),
              Text("Email here!", style: Theme.of(context).textTheme.bodyMedium),

              
               
    

              
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress:(){}),

              const Divider(color: Colors.grey),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress:(){}),
            ],
        ),
      ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,

    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width:40, 
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.purple.withOpacity(0.1),
          ),
        child: Icon(icon, color: Colors.purple),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.apply(color:textColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: const Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey) 
      ): null,
    );
  }
}
