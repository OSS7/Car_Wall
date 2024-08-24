import 'package:carwall/core/constant/colors.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.title,
    this.showTitle,
    this.isRequired,
    required this.items,
    required this.onPress,
    this.backColor,
    this.onInit,
    this.onClear,
  });

  late String title;
  late String? showTitle;
  final List? items;
  final bool? isRequired;
  final Color? backColor;

  final Function(SelectedListItem) onPress;
  final Function()? onInit;
  final Function()? onClear;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _choosen;

  String _showTitle = '';

  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _showTitle = widget.showTitle?.isEmpty ?? true ? widget.title : _showTitle;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: cPrimary),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: double.infinity,
                    child: TextButton(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _choosen ?? widget.title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: cPrimary,
                          ),
                        ),
                      ),
                      onPressed: () {
                        openDialog(
                          context,
                          title: _showTitle,
                          onPress: (value) {
                            setState(() {
                              _choosen = value.name;
                            });
                            widget.onPress(value);
                          },
                          list: widget.items
                                  ?.map(
                                    (e) => SelectedListItem(
                                      name: e.name.toString(),
                                      value: e.id.toString(),
                                      isSelected: true,
                                    ),
                                  )
                                  .toList() ??
                              [],
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.onClear != null && _showTitle != widget.title,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      if (widget.onClear != null) widget.onClear!();
                      setState(
                        () {
                          _showTitle = widget.title;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void openDialog(
  BuildContext context, {
  required List<SelectedListItem> list,
  required String title,
  required Function(SelectedListItem) onPress,
}) {
  final controller = TextEditingController();
  final colorScheme = Theme.of(context).colorScheme;

  DropDownState(
    DropDown(
      selectedItems: (value) {
        onPress(value.first as SelectedListItem);
      },
      searchWidget: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: cBlack,
            fontSize: 13,
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          filled: true,
          fillColor: Colors.black12,
          contentPadding: const EdgeInsets.only(
            left: 0,
            bottom: 0,
            top: 0,
            right: 15,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          prefixIcon: const IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          suffixIcon: GestureDetector(
            child: const Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      bottomSheetTitle: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: cPrimary,
          ),
        ),
      ),
      data: list,
    ),
  ).showModal(context);
}
