import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Contact List App', () {
    final addContactButton = find.byValueKey('add_contact_button');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Add Contact', () async {
      await driver.tap(addContactButton);
    });
  });
}
