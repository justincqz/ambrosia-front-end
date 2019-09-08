import 'package:ambrosia/model/recipe.dart';
import 'package:ambrosia/widget/scroll_bru.dart';
import 'package:ambrosia/widget/silver_card_delegate.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe _recipe;

  RecipeScreen(recipe) : _recipe = recipe;

  @override
  State<StatefulWidget> createState() => RecipeScreenState(_recipe);
}

class RecipeScreenState extends State<RecipeScreen> {
  final Recipe _recipe;
  final ScrollController _controller = ScrollController();

  RecipeScreenState(recipe) : _recipe = recipe;

  @override
  Widget build(BuildContext context) {
    print(_recipe.photo[0]);
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_recipe.photo[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ScrollBru(
                controller: _controller,
                bru: (height) => Container(
                  color: Colors.white,
                  height: height,
                ),
              ),
              CustomScrollView(
                controller: _controller,
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    delegate: SliverCardDelegate(
                      maxExtent: 700,
                      minExtent: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
