class MagnumIntegration < Formula
  desc "Integration libraries for the Magnum C++11/C++14 graphics engine"
  homepage "https://magnum.graphics"
  url "https://github.com/mosra/magnum-integration/archive/v2019.10.tar.gz"
  # wget https://github.com/mosra/magnum-integration/archive/v2019.10.tar.gz -O - | sha256sum
  sha256 "c96a8237878ae7d74a8a4331122f96a50374d2eee6aed8f15bb039321d66fd48"
  head "git://github.com/mosra/magnum-integration.git"

  depends_on "cmake" => :build
  depends_on "eigen" => :recommended
  depends_on "glm" => :recommended
  depends_on "magnum"
  depends_on "bullet" => :recommended
  depends_on "dartsim" => :optional

  def install
    # Bundle ImGui
    system "curl", "-L", "https://github.com/ocornut/imgui/archive/v1.76.tar.gz", "-o", "src/MagnumExternal/imgui.tar.gz"
    cd "src/MagnumExternal" do
      system "mkdir", "ImGui"
      system "tar", "xzvf", "imgui.tar.gz", "-C", "ImGui", "--strip-components=1"
    end

    system "mkdir build"
    cd "build" do
      system "cmake",
        "-DCMAKE_BUILD_TYPE=Release",
        "-DCMAKE_INSTALL_PREFIX=#{prefix}",
        "-DWITH_BULLET=#{(build.with? 'bullet') ? 'ON' : 'OFF'}",
        "-DWITH_DART=#{(build.with? 'dartsim') ? 'ON' : 'OFF'}",
        "-DWITH_EIGEN=#{(build.with? 'eigen') ? 'ON' : 'OFF'}",
        "-DWITH_GLM=#{(build.with? 'glm') ? 'ON' : 'OFF'}",
        "-DWITH_IMGUI=ON",
        ".."
      system "cmake", "--build", "."
      system "cmake", "--build", ".", "--target", "install"
    end
  end
end
