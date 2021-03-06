import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unsplash/hooks/theme.dart';

class SearchBar extends HookWidget {
  final Function(String) onSearch;
  final Animation<double> animation;
  final String initValuel;

  SearchBar({required this.onSearch, required this.animation, required this.initValuel});
  @override
  Widget build(BuildContext context) {
    var theme = useTheme();
    var searchText = useState('');
    var textInputController = useState(TextEditingController(text: initValuel));
    border() => OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: theme.primaryColor),
        );
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: (Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: 70,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.transparent,
          child: TextFormField(
            controller: textInputController.value,
            onChanged: (s) => searchText.value = s,
            onEditingComplete: () {
              onSearch(searchText.value);
            },
            decoration: InputDecoration(
              fillColor: theme.primaryColorLight,
              filled: true,
              suffixIcon: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          onSearch(searchText.value);
                        },
                        icon: Icon(Icons.search)),
                    textInputController.value.text.length > 0
                        ? IconButton(
                            onPressed: () {
                              searchText.value = '';
                              textInputController.value.text = '';
                              onSearch(searchText.value);
                            },
                            icon: Icon(Icons.cancel_outlined))
                        : Container(),
                  ],
                ),
              ),
              focusedBorder: border(),
              disabledBorder: border(),
              enabledBorder: border(),
            ),
          ),
        )),
      ),
    );
  }
}
