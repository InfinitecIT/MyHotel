import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myhotel/models/UpdateCleaningStatusReq.dart';
import 'package:myhotel/models/UpdateCleaningStatusResp.dart';
import 'package:myhotel/models/UpdateMaintenanceStatusResp.dart';
import 'package:myhotel/utils/Globals.dart';
import 'package:myhotel/utils/http/HttpAPI.dart';

import '../models/UpdateMaintenanceStatusReq.dart';

class RoomView extends StatefulWidget {
  final int roomIndex;
  const RoomView({required this.roomIndex, super.key});

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  int _isCleaningOn = 0; // Initial switch state for cleaning

  int _isMaintenanceOn = 0; // Initial switch state for maintenance
  final TextEditingController _notesController = TextEditingController(); // Controller for notes text field
  // String isMaintenanceNotes = 'Enter notes here...';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isCleaningOn = Globals.rooms[widget.roomIndex].isCleaning ?? 0;
      _isMaintenanceOn = Globals.rooms[widget.roomIndex].isMaintenance ?? 0;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _notesController.dispose();
    super.dispose();
  }

  updateRoomStatus(bool isCleaning) async {
    int cleaningStatus = isCleaning ? 1 : 0; // Convert bool to int
    var jsonIn = UpdateCleaningStatusReq(Globals.rooms[widget.roomIndex].roomId, cleaningStatus).toJson();
    var request = await HttpAPI().postNOAUTH(jsonIn, "UpdateRoomCleaningStatus");
    var response = UpdateCleaningStatusResp.fromJson(request?.body);
    if (response.success == 1) {
      setState(() {
        _isCleaningOn = cleaningStatus;
        Globals.rooms[widget.roomIndex].isCleaning = cleaningStatus;
        log("Updated Room Cleaning Status");
      });
    }
  }

  updateMaintenanceStatus(bool isMaintenance) async {
    int maintenanceStatus = isMaintenance ? 1 : 0; // Convert bool to int
    var jsonIn = UpdateMaintenanceStatusReq(Globals.rooms[widget.roomIndex].roomId, maintenanceStatus).toJson();
    var request = await HttpAPI().postNOAUTH(jsonIn, "UpdateMaintenanceStatus");
    var response = UpdateMaintenanceStatusResp.fromJson(request?.body);
    if (response.success == 1) {
      setState(() {
        _isMaintenanceOn = maintenanceStatus;
        Globals.rooms[widget.roomIndex].isMaintenance = maintenanceStatus;
        log("Updated Room Maintenance Status");
      });
    }
  }

// **************************************************************************
// Update Maintenace Notes ** TO BE FIXED!!
// **************************************************************************

  // updateMaintenanceNotes(String maintenanceNotes) async {
  //   var jsonIn = UpdateMaintenanceStatusReq(Globals.rooms[widget.roomIndex].roomId, maintenanceNotes).toJson();
  //   var request = await HttpAPI().postNOAUTH(jsonIn, "UpdateMaintenanceNotes");
  //   var response = UpdateMaintenanceStatusResp.fromJson(request?.body);
  //   if (response.success == 1) {
  //     isMaintenanceNotes = maintenanceNotes;
  //     setState(() {
  //       log("Updated Maintenance Notes");
  //     });
  //   }
  // }

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
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 1, bottom: 1),
                    child: Image.asset(
                      "assets/Logo.png",
                      height: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 1),
                  child: Text(
                    "Room ${Globals.rooms[widget.roomIndex].roomNumber}", // Access roomIndex through widget
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ],
            )),
      ),
      body: Stack(
        // Use Stack to overlay the button over the SingleChildScrollView
        children: [
          SingleChildScrollView(
            // Makes the layout scrollable
            child: Container(
              padding: const EdgeInsets.all(5),
              height: size.height, // Ensure the container fills the screen vertically
              width: size.width, // Ensure the container fills the screen horizontally
              color: const Color.fromARGB(255, 95, 157, 207),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                  children: [
                    Container(
                      // New container for Room and Guest Details
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Room Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Guest Details', style: TextStyle(fontSize: 16)),
                          // Add more details as needed
                        ],
                      ),
                    ),
                    // Container for the Cleaning On/Off slider
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5), // Apply border radius
                        border: Border.all(color: Colors.black, width: 1), // Add a black outline
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Cleaning'),
                              Switch(
                                value: _isCleaningOn == 1,
                                onChanged: (value) => updateRoomStatus(value),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Container for the Maintenance On/Off slider
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5), // Apply border radius
                        border: Border.all(color: Colors.black, width: 1), // Add a black outline
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Maintenance'),
                                Switch(
                                  value: _isMaintenanceOn == 1,
                                  onChanged: (value) => updateMaintenanceStatus(value),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextField(
                                controller: _notesController,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText: 'Enter notes here...',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  // Optionally reduce the TextField's border to match the container's style more closely
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                              height: 8,
                            ), // Space between text field and button
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Logic to update notes
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // backgroundColor: Colors.blue, // Text color
                                  ),
                                  child: const Text('Update Notes'),
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 95, 157, 207), // Set the background color of the container
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width - 16, 60), // Adjust the size as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Assign Guest'),
        ),
      ),
    );
  }
}
