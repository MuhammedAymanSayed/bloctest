import 'package:bloctest/business/cubit/charachters_cubit.dart';
import 'package:bloctest/constants/my_colors.dart';
import 'package:bloctest/data/models/characters.dart';
import 'package:bloctest/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharachterScreen extends StatefulWidget {
  const CharachterScreen({Key? key}) : super(key: key);

  @override
  State<CharachterScreen> createState() => _CharachterScreenState();
}

class _CharachterScreenState extends State<CharachterScreen> {
  List<Character> allCharacters = [];

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharachtersCubit>(context).getAllCharacters();
        for (var i = 0; i < allCharacters.length; i++) {
          print(allCharacters[i]);
        }
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharachtersCubit, CharachtersState>(
      builder: (context, state) {
        if (state is LoadedCharachters) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: allCharacters.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character: allCharacters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text(
          'Characters',
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
