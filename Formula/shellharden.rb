class Shellharden < Formula
  desc "Bash syntax highlighter and linter that can apply its suggestions"
  homepage "https://github.com/anordal/shellharden"
  url "https://github.com/anordal/shellharden/archive/v3.1.tar.gz"
  sha256 "293ef20ea4ecb6927f873591bb6d452979ebc31af80fdad48c173816b4ae6c6f"
  depends_on "rust" => :build

  def install
    system "rustc", "shellharden.rs"
    bin.install "shellharden"
  end

  test do
    (testpath/"test.bash").write <<~EOS
      #!/usr/bin/env bash
      echo ${0}
    EOS
    system "#{bin}/shellharden", "test.bash"
  end
end
