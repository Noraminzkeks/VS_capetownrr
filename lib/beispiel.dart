ElevatedButton.icon(   // <-- ElevatedButton
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => const Login(title: '')),
);
},
icon: const Icon(
Icons.account_circle,
size: 24.0,
),

label: const Text('Einloggen'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
minimumSize: const Size(175, 60),
),
),