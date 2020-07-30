import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen({this.saveFilters, this.currentFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutinFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();

    _glutinFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
  }

  Widget _buildSwitchListStyle({
    String title,
    String subtitle,
    bool value,
    Function onChangedHandler,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChangedHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutinFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListStyle(
                title: 'Gluten free',
                subtitle: 'Only include Gluten free meal',
                value: _glutinFree,
                onChangedHandler: (newValue) {
                  setState(() {
                    _glutinFree = newValue;
                  });
                },
              ),
              _buildSwitchListStyle(
                title: 'Vegetarian',
                subtitle: 'Only include Vegetarian meal',
                value: _vegetarian,
                onChangedHandler: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListStyle(
                title: 'Vegan',
                subtitle: 'Only include Vegan meal',
                value: _vegan,
                onChangedHandler: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListStyle(
                title: 'Lactos free',
                subtitle: 'Only include Lactos free meal',
                value: _lactoseFree,
                onChangedHandler: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
