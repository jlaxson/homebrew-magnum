class MagnumPlugins < Formula
  desc "Plugins for the Magnum C++11/C++14 graphics engine"
  homepage "https://magnum.graphics"
  url "https://github.com/mosra/magnum-plugins/archive/v2019.10.tar.gz"
  # wget https://github.com/mosra/magnum-plugins/archive/v2019.10.tar.gz -O - | sha256sum
  sha256 "d475e7d153a926e3194f9f7f7716e9530214e35b829438f8900c5c0c84741d03"
  head "git://github.com/mosra/magnum-plugins.git"

  depends_on "assimp"
  depends_on "cmake"
  depends_on "magnum"
  depends_on "devil"
  depends_on "faad2"
  depends_on "freetype"
  depends_on "harfbuzz"
  depends_on "libpng"
  depends_on "jpeg"

  def install
    system "mkdir build"
    cd "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DWITH_ASSIMPIMPORTER=ON", "-DWITH_BASISIMAGECONVERTER=OFF", "-DWITH_BASISIMPORTER=OFF", "-DWITH_DDSIMPORTER=ON", "-DWITH_DEVILIMAGEIMPORTER=ON", "-DWITH_DRFLACAUDIOIMPORTER=ON", "-DWITH_DRMP3AUDIOIMPORTER=ON", "-DWITH_DRWAVAUDIOIMPORTER=ON", "-DWITH_FAAD2AUDIOIMPORTER=ON", "-DWITH_FREETYPEFONT=ON", "-DWITH_HARFBUZZFONT=ON", "-DWITH_JPEGIMAGECONVERTER=ON", "-DWITH_JPEGIMPORTER=ON", "-DWITH_MINIEXRIMAGECONVERTER=ON", "-DWITH_OPENGEXIMPORTER=ON", "-DWITH_PNGIMAGECONVERTER=ON", "-DWITH_PNGIMPORTER=ON", "-DWITH_STANFORDIMPORTER=ON", "-DWITH_STBIMAGECONVERTER=ON", "-DWITH_STBIMAGEIMPORTER=ON", "-DWITH_STBTRUETYPEFONT=ON", "-DWITH_STBVORBISAUDIOIMPORTER=ON", "-DWITH_TINYGLTFIMPORTER=ON", ".."
      system "cmake", "--build", "."
      system "cmake", "--build", ".", "--target", "install"
    end
  end
end
