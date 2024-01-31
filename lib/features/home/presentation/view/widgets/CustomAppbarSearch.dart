import 'package:chat_app/core/widgets/CustomTextfield.dart';
import 'package:flutter/material.dart';

class CustomAppBarSearch extends StatelessWidget {
  const CustomAppBarSearch({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .8,
            child: CustomTextField(
              hintText: 'Search',
              icon2: Icons.search,
              fillcolor: Colors.black.withOpacity(.1),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
