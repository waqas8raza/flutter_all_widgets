import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_strip/providers/counter_provider.dart';
import 'package:flutter_strip/providers/list_provider.dart';
import 'package:flutter_strip/providers/loader_provider.dart';
import 'package:flutter_strip/providers/slider_provider.dart';
import 'package:provider/provider.dart';

class StripPage extends StatefulWidget {
  const StripPage({super.key});

  @override
  State<StripPage> createState() => _StripPageState();
}

class _StripPageState extends State<StripPage> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    log('Build');
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Strip"),
        ),
        body: Consumer<CounterProvider>(
          builder: (context, value, child) => Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DropdownButton<String>(
                    hint: const Text('Select an item'),
                    value: _selectedValue,
                    items: <String>['Item 1', 'Item 2', 'Item 3', 'Item 4']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                  ),
                  Text(value.count.toString()),
                  //Text(counter.count.toString()),
                  ElevatedButton(
                      onPressed: () {
                        // counter.increment();
                        value.increment(3);
                      },
                      child: const Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        value.decrement();
                      },
                      child: const Text("Remove")),
                  Consumer<SliderProvider>(
                    builder: (context, value, child) => Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(value.sliderValue),
                          borderRadius:
                              BorderRadius.circular(value.sliderValue * 60)),
                    ),
                  ),
                  Consumer<SliderProvider>(
                    builder: (context, slider, child) => Slider(
                      value: slider.sliderValue.toDouble(),
                      onChanged: (value) {
                        slider.setSlider(value);
                        // print(slider.sliderValue);
                      },
                    ),
                  ),

                  Consumer<LoaderProvider>(
                    builder: (context, value, child) => value.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Start Loading'),
                  ),
                  Consumer<LoaderProvider>(
                      builder: (context, value, child) => ElevatedButton(
                          onPressed: () {
                            value.setLoading();
                          },
                          child: Text(value.isLoading ? 'Stop' : "Start"))),

                  Consumer<ListProvider>(
                    builder: (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.names.length,
                      itemBuilder: (context, index) => Text(value.names[index]),
                    ),
                  ),
                  Consumer<ListProvider>(
                      builder: (context, value, child) => ElevatedButton(
                          onPressed: () {
                            value.addItem('new name');
                          },
                          child: const Text("add")))
                ],
              ),
            ),
          ),
        ));
  }
}
