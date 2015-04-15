// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test_loader;

import "dart:io";
import "package:unittest/unittest.dart";
import "package:packagemap/packagemap.dart";
import "package:packagemap/loader.dart";

main() {
  test("load", () {
    // Test works if run from text/ directory or package root directory.
    var file = new File("sample-packages.map");
    if (!file.existsSync()) {
      file = new File("test/sample-packages.map");
    }
    return loadPackageConfig(file.absolute)
    .then((Packages packages) {
      Uri resolved = packages.resolve(Uri.parse("package:foo/bar/baz.dart"));
      expect(resolved.path.endsWith("/lib/bar/baz.dart"), isTrue);
    });
  });
}
