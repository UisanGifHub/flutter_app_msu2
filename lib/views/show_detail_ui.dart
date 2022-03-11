import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetail extends StatefulWidget {
  //สร้างตัวแปรที่จะรับค่าที่จะส่งมาอีกหน้านึง
  String? name_fs, web_fs, facebook_fs, phone_fs, image_fs, lat_fs, lng_fs;

  ShowDetail({
    Key? key,
    this.name_fs,
    this.web_fs,
    this.facebook_fs,
    this.phone_fs,
    this.image_fs,
    this.lat_fs,
    this.lng_fs,
  }) : super(key: key);

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: Text(
          'รายละเอียดร้าน',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Image.asset(
              'assets/images/' + widget.image_fs.toString(),
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: Card(
                elevation: 10.0, //ใส่เงาให้การ์ด
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.home,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            widget.name_fs.toString(),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(widget.web_fs.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.web_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.facebook_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.green,
                              size: 60.0,
                    
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.phone_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser('https://www.google.co.th/maps/@${widget.lat_fs.toString()},${widget.lng_fs.toString()}z');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.lat_fs.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
