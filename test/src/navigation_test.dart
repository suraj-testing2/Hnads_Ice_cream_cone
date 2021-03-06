/*
Copyright 2013 Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

@TestOn('vm')
library webdriver_test.navigation;

import 'package:sync_webdriver/sync_webdriver.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void main() {
  group('Navigation', () {
    WebDriver driver;

    setUp(() {
      driver = createTestDriver();
      driver.url = 'http://www.google.com/ncr';
    });

    tearDown(() {
      driver.quit();
      driver = null;
    });

    test('forward/back', () {
      driver.url = testPagePath;
      driver.navigate.back();
      waitFor(() => driver.title, contains('Google'));
      driver.navigate.forward();
      waitFor(() => driver.title, contains('test_page'));
    }, skip: 'TODO(DrMarcII): figure out why this test is not finishing');

    test('refresh', () {
      var element = driver.findElement(new By.name('q'));
      driver.navigate.refresh();
      waitFor(() => () => element.name,
          throwsA(new isInstanceOf<StaleElementReferenceException>()));
    });
  });
}
