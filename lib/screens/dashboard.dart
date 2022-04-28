import 'package:bytebank/screens/contacts/list.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Página Inicial';
const _titleContacts = 'Contatos';
const _iconContacts = Icons.people;
const _titleTransfer = 'Transferências';
const _iconTransfer = Icons.money;
const _imageLogo = 'images/logo.png';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              foregroundDecoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: AssetImage(_imageLogo),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              width: double.maxFinite,
              height: 400,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContactsList(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Vertical
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Horizontal
                        children: const [
                          Icon(
                            _iconContacts,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(
                            _titleContacts,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListTransfer(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Vertical
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Horizontal
                        children: const [
                          Icon(
                            _iconTransfer,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(
                            _titleTransfer,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
