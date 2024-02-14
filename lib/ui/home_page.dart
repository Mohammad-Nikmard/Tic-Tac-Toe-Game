import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> game = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];

String winnerTellerO = "";
String winnerTellerX = "";
int winnerO = 0;
int winnerX = 0;
int draw = 0;
bool turnO = true;
bool winnerstatement = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/background.png"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              refreshButton(),
              const SizedBox(height: 10.0),
              statement(),
              const SizedBox(height: 20.0),
              playAgainButton(),
              const SizedBox(height: 40.0),
              _getgrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getgrid() {
    return Container(
      height: 350.0,
      width: 350.0,
      decoration: BoxDecoration(
        color: Colors.purple[500],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                tapped(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple[800],
                  ),
                  child: Center(
                    child: Text(
                      game[index],
                      style: TextStyle(
                        color: game[index] == "o" ? Colors.green : Colors.red,
                        fontSize: 55,
                        fontFamily: "OSR",
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void tapped(index) {
    setState(() {
      if (game[index] != "") {
        return;
      }
      if (winnerstatement == true) {
        return;
      }
      if (turnO) {
        game[index] = "o";
        draw++;
      } else {
        game[index] = "x";
        draw++;
      }

      turnO = !turnO;

      winner();
    });
  }

  void winner() {
    if (game[0] == game[1] && game[0] == game[2] && game[0] != "") {
      winState(game[0], "Winner", "Loser");
      return;
    }
    if (game[3] == game[4] && game[3] == game[5] && game[3] != "") {
      winState(game[3], "Winner", "Loser");
      return;
    }
    if (game[6] == game[7] && game[6] == game[8] && game[6] != "") {
      winState(game[6], "Winner", "Loser");
      return;
    }
    if (game[0] == game[3] && game[0] == game[6] && game[0] != "") {
      winState(game[0], "Winner", "Loser");
      return;
    }
    if (game[1] == game[4] && game[1] == game[7] && game[1] != "") {
      winState(game[1], "Winner", "Loser");
      return;
    }
    if (game[2] == game[5] && game[2] == game[8] && game[2] != "") {
      winState(game[2], "Winner", "Loser");
      return;
    }
    if (game[0] == game[4] && game[0] == game[8] && game[0] != "") {
      winState(game[0], "Winner", "Loser");
      return;
    }
    if (game[2] == game[4] && game[2] == game[6] && game[2] != "") {
      winState(game[2], "Winner", "Loser");
      return;
    }
    if (draw == 9) {
      winState("z", "Draw!", "Draw!");
    }
  }

  void winState(String indexlist, String winnertext, String losertext) {
    setState(() {
      winnerstatement = true;
      if (indexlist == "o") {
        winnerTellerO = winnertext;
        winnerTellerX = losertext;
        winnerO++;
      } else if (indexlist == "x") {
        winnerTellerO = losertext;
        winnerTellerX = winnertext;
        winnerX++;
      } else if (draw == 9) {
        winnerTellerO = winnertext;
        winnerTellerX = losertext;
      }
    });
  }

  Widget playAgainButton() {
    return Visibility(
      visible: winnerstatement,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200.0, 40),
          side: const BorderSide(color: Colors.white, width: 2.0),
        ),
        onPressed: () {
          setState(() {
            turnO = true;
            winnerstatement = false;
            draw = 0;
            game.setAll(0, ["", "", "", "", "", "", "", "", ""]);
          });
        },
        child: const Text(
          "Play again !",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget refreshButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              game.setAll(0, ["", "", "", "", "", "", "", "", ""]);
              winnerO = 0;
              winnerX = 0;
              draw = 0;
              winnerstatement = false;
              turnO = true;
            });
          },
          icon: Image.asset(
            "images/refresh_circle.png",
            height: 30.0,
            width: 30.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget statement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "$winnerO",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "OSR",
              ),
            ),
            Container(
              height: 160.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 106, 27, 154),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: turnO == true
                      ? Colors.white
                      : const Color.fromARGB(255, 106, 27, 154),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("images/male.png"),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Player O",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "OSR",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Image.asset(
                    "images/o.png",
                    height: 35.0,
                    width: 35.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Visibility(
              visible: winnerstatement,
              child: Text(
                winnerTellerO,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "$winnerX",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "OSR",
              ),
            ),
            Container(
              height: 160.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: turnO == false
                      ? Colors.white
                      : const Color.fromARGB(255, 106, 27, 154),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("images/female.png"),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Player X",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "OSR",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Image.asset(
                    "images/x.png",
                    height: 38.0,
                    width: 38.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Visibility(
              visible: winnerstatement,
              child: Text(
                winnerTellerX,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
