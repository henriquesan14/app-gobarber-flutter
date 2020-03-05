import 'package:app_gobarber/pages/dashboard/prestadores/horarios_prestador_page.dart';
import 'package:flutter/material.dart';
import 'package:app_gobarber/models/provider.dart';

class CardPrestador extends StatelessWidget {
  final Provider provider;
  
  CardPrestador(this.provider);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 65,
              height: 65,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage: NetworkImage(
                    provider.avatar == null ? "https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg" : provider.avatar.url),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              provider.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HorariosPrestadorPage(provider)));
      },
    );
  }
}
