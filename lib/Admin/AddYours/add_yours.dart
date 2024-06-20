import 'dart:math';

import 'package:car_admin/Admin/page/deleteAndUpdate/delete_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddYours extends StatefulWidget {
  const AddYours({super.key});

  @override
  State<AddYours> createState() => _AddYoursState();
}

class _AddYoursState extends State<AddYours> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _slotController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Parking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Lottie.asset(
                    'Assets/animation/running_car.json',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _slotController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Slots',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the number of slots';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () async{
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DisplayPage()),
                        );
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                          ],
                          transform: GradientRotation(pi / 4),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    // Create a Firestore instance
    final firestoreInstance = FirebaseFirestore.instance;

    // Get values from controllers
    String name = _nameController.text;
    String address = _addressController.text;
    String location = _locationController.text;
    int slots = int.parse(_slotController.text);
    String mobileNumber = _mobileNumberController.text;

    // Create a map representing the data to be stored
    Map<String, dynamic> formData = {
      'name': name,
      'address': address,
      'location': location,
      'slots': slots,
      'mobileNumber': mobileNumber,
    };

    try {
      // Add data to Firestore
      await firestoreInstance.collection('parkdetail').add(formData);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Form submitted successfully!'),
      ));

      // Clear form fields
      _nameController.clear();
      _addressController.clear();
      _locationController.clear();
      _slotController.clear();
      _mobileNumberController.clear();
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error submitting form: $e'),
      ));
    }
  }
}
