# widget_tools

A set of useful widget tools that are missing from the flutter framework.

## [PlatformBuilder]

The [PlatformBuilder] widget allows for grouping of multiple slivers together such that they can be returned as a single widget.
For instance when one wants to wrap a few slivers with some padding or an inherited widget.


### Example
```dart
class PlatformButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      iOSBuilder: (context) {
        return CupertinoButton.filled(
            onPressed: () {
                print('submitted');
            },
            child: Text('Submit'),
        );
      },
      builder: (context, platform) { // required
        return ElevatedButton(
            onPressed: () {
                print('submitted');
            },
            child: Text('Submit'),
        );
      },
    );
  }
}
```
