class SwiftFormat53 < Formula
  desc "Formatting technology for Swift source code"
  homepage "https://github.com/apple/swift-format"
  url "https://github.com/apple/swift-format.git",
    tag:      "swift-5.3-branch",
    revision: "12089179aa1668a2478b2b2111d98fa37f3531e3"
  license "Apache-2.0"
  version_scheme 1
  head "https://github.com/apple/swift-format.git"

  depends_on xcode: ["12.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/swift-format"
    doc.install "Documentation/Configuration.md"
  end

  test do
    (testpath/"test.swift").write " print(  \"Hello, World\"  ) ;"
    assert_equal "print(\"Hello, World\")\n", shell_output("#{bin}/swift-format test.swift")
  end
end
