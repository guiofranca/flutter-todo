import 'package:fluter_todo_app/pages/all_todos.dart/all_todos_page.dart';
import 'package:fluter_todo_app/pages/all_todos.dart/completed_todos_page.dart';
import 'package:fluter_todo_app/pages/all_todos.dart/uncompleted_todos_page.dart';
import 'package:flutter/material.dart';

class ToDosPage extends StatefulWidget {
  const ToDosPage({super.key});

  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {
  late PageController pageController;
  int currentPage = 0;

  final List<Widget> _children = [
    const AllToDosPage(),
    const UncompletedToDosPage(),
    const CompletedToDosPage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
    );
    setCurrentPage(currentPage);
  }

  setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  menuItemTapped(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: setCurrentPage,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting,
        //selectedItemColor: Colors.blue,
        //unselectedItemColor: Colors.black45,
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive), label: 'All'),
          BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_top), label: 'To do'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_rounded), label: 'Completed'),
        ],
        onTap: menuItemTapped,
      ),
    );
  }
}
