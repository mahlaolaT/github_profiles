import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const UserSearchField(),
        body: Container(),
      ),
    );
  }
}

class UserSearchField extends StatelessWidget implements PreferredSizeWidget {
  const UserSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        onChanged: (query) {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size(400, 90);
}
