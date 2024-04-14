import 'package:flutter/material.dart';
import 'package:myhotel/utils/Globals.dart';
import 'package:myhotel/utils/http/HttpAPI.dart';
import 'package:myhotel/views/CustomButton.dart';
import 'package:myhotel/views/RoomView.dart';

import '../models/GetHotelRoomsResp.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  List<Rooms> rooms = [];
  List<Rooms> displayedRooms = [];

  String filter = 'all'; // This will keep track of the current filter type

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  getRooms() async {
    var request = await HttpAPI().postNOAUTH("{}", "GetHotelRooms");
    var response = GetHotelRoomsResp.fromJson(request?.body);
    if (response.success == 1) {
      Globals.rooms = response.rooms ?? [];
      setState(() {
        displayedRooms = Globals.rooms;
      });
    }
  }

  void filterRooms(String type) {
    setState(() {
      filter = type;
      switch (type) {
        case 'available':
          displayedRooms = Globals.rooms.where((room) => room.guestName == null && room.maintenanceStatus != 1 && room.cleaningStatus != 1).toList();
          break;
        case 'cleaning':
          displayedRooms = Globals.rooms.where((room) => room.cleaningStatus == 1).toList();
          break;
        case 'maintenance':
          displayedRooms = Globals.rooms.where((room) => room.maintenanceStatus == 1).toList();
          break;
        default:
          displayedRooms = Globals.rooms;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blue[800]!, width: 2),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 1, bottom: 1),
                child: Image.asset(
                  "assets/Title.png",
                  height: 80,
                ),
              ),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2, // Adjust flex as needed to distribute space
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 2),
                    child: CustomButton(
                      buttonText: 'All  ',
                      onPressed: () => filterRooms('all'),
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      buttonTextColor: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CustomButton(
                      buttonText: 'Available ',
                      onPressed: () => filterRooms('available'),
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      buttonTextColor: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CustomButton(
                      buttonText: 'Cleaning ',
                      onPressed: () => filterRooms('cleaning'),
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      buttonTextColor: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4),
                    child: CustomButton(
                      buttonText: 'Maintenance ',
                      onPressed: () => filterRooms('maintenance'),
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      buttonTextColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedRooms.length,
              itemBuilder: (context, index) {
                var room = displayedRooms[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: GestureDetector(
                    onTap: () => Globals.showPage(RoomView(
                      roomIndex: index,
                    )),
                    child: Container(
                      height: 75,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue[800]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Room ${room.roomNumber}",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person), // Person icon
                                      Text(" ${room.sleeps}"), // Number of sleeps next to the person icon
                                      SizedBox(width: 10), // Spacing between the items
                                      Icon(Icons.bed), // Bed icon
                                      Text(" ${room.beds}"), // Number of beds next to the bed icon
                                      SizedBox(width: 10), // Spacing between the items
                                      Icon(Icons.meeting_room), // Room icon
                                      Text(" ${room.rooms}"), // Number of rooms next to the room icon
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5), // Adjust the padding as needed
                            child: Row(
                              children: [
                                Visibility(
                                  visible: room.cleaningStatus == 1,
                                  child: Icon(Icons.cleaning_services, color: Colors.orange),
                                ),
                                Visibility(
                                  visible: room.maintenanceStatus == 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(Icons.handyman, color: Colors.orange),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  width: 15, // Adjust the width of the status bar as needed
                                  height: 65, // Optional: if you want the status bar shorter than the item
                                  decoration: BoxDecoration(
                                    color: room.guestName != null
                                        ? Colors.red
                                        : room.maintenanceStatus == 1
                                            ? Colors.red
                                            : Colors.green,
                                    borderRadius: BorderRadius.circular(5), // Optional: if you want rounded corners for the status bar
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
