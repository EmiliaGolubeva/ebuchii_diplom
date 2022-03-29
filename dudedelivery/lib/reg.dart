import 'package:flutter/material.dart';

class Reg extends StatefulWidget {
  const Reg({Key key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 90.0),
              child: Text(
                "Регистрация",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 160.0, bottom: 20, top: 8),
              child: Text(
                "Создайте новый аккаунт",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 20, left: 20, bottom: 12),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Имя пользователя',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 20, left: 20, bottom: 12),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Электронная почта',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 20, left: 20, bottom: 20),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Пароль',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(fontSize: 15),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Уже есть аккаунт"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
