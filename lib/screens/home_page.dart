import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: const AssetImage("images/background.jpg"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              _icon(),
              SizedBox(height: 20.0),
              _statement(),
              SizedBox(height: 20.0),
              _playagain(),
              SizedBox(height: 40.0),
              _getgrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
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
              winnerstatement = false;
              turnO = true;
            });
          },
          icon: Image(
            image: AssetImage("images/refresh-circle-svgrepo-com.png"),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _statement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "$winnerO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Container(
              height: 160.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 106, 27, 154),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: turnO == true
                      ? Colors.white
                      : Color.fromARGB(255, 106, 27, 154),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("images/male.jpg"),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Player O",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Image(
                    image: AssetImage("images/1.png"),
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Visibility(
              visible: winnerstatement,
              child: Text(
                winnerTellerO,
                style: TextStyle(
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Container(
              height: 160.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: turnO == false
                      ? Colors.white
                      : Color.fromARGB(255, 106, 27, 154),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("images/female.jpg"),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Player X",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Image(
                    image: AssetImage("images/2.png"),
                    height: 38.0,
                    width: 38.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Visibility(
              visible: winnerstatement,
              child: Text(
                winnerTellerX,
                style: TextStyle(
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

  Widget _playagain() {
    return Visibility(
      visible: winnerstatement,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(200.0, 40),
          side: BorderSide(color: Colors.white, width: 2.0),
        ),
        onPressed: () {
          setState(() {
            turnO = true;
            winnerstatement = false;
            game.setAll(0, ["", "", "", "", "", "", "", "", ""]);
          });
        },
        child: Text("Play again !",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget _getgrid() {
    return Container(
      height: 370.0,
      width: 370.0,
      decoration: BoxDecoration(
        color: Colors.purple[500],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                tapped(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  child: Center(
                    child: Text(
                      game[index],
                      style: TextStyle(
                        color: game[index] == "o" ? Colors.red : Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.purple[800]),
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
      print("Draw !");
    }
  }

  void winState(String indexlist, String winnertext, String losertext) {
    winnerstatement = true;

    setState(() {
      if (indexlist == "o") {
        winnerTellerO = winnertext;
        winnerTellerX = losertext;
        winnerO++;
      } else if (indexlist == "x") {
        winnerTellerO = losertext;
        winnerTellerX = winnertext;
        winnerX++;
      } else if (draw == 9) {
        winnerTellerO = "Draw !";
        winnerTellerX = "Draw !";
      }
    });
  }
}
