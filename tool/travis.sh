#!/bin/bash

# Copyright 2013 Google Inc. All Rights Reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Fast fail the script on failures.
set -e

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  lib/sync_pageloader.dart \
  lib/sync_webdriver.dart \
  test/pageloader_test.dart \
  test/src/alert_test.dart \
  test/src/command_event_test.dart \
  test/src/command_listener_test.dart \
  test/src/keyboard_test.dart \
  test/src/logs_test.dart \
  test/src/mouse_test.dart \
  test/src/navigation_test.dart \
  test/src/options_test.dart \
  test/src/target_locator_test.dart \
  test/src/util_test.dart \
  test/src/web_driver_test.dart \
  test/src/web_element_test.dart \
  test/src/window_test.dart

# Start chromedriver.
chromedriver --port=4444 --url-base=wd/hub &

# Run tests
pub run test -p vm -r expanded
