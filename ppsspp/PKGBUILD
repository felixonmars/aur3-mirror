# Contributor: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
pkgname=ppsspp
pkgver=0.9.9
pkgrel=1
pkgdesc="A PSP emulator for Android, Windows, Mac, and Linux, written in C++."
arch=(i686 x86_64)
url="http://www.ppsspp.org"
license=("custom, GPL2")
depends=(zlib sdl ffmpeg glu)
makedepends=(cmake setconf)
conflicts=(ppsspp-git)
source=("https://github.com/hrydgard/ppsspp/archive/v$pkgver.tar.gz"
"ppsspp-ffmpeg-for-$pkgver.tar.gz::https://github.com/hrydgard/ppsspp-ffmpeg/archive/bc6302be00fdb71ac5e24b40c5e826d4e8a9a2ac.tar.gz"
"ppsspp-lang-for-$pkgver.tar.gz::https://github.com/hrydgard/ppsspp-lang/archive/7876a52ff1591a4a44b35e83b0e95a2a59125821.tar.gz"
"native-for-$pkgver.tar.gz::https://github.com/hrydgard/native/archive/78941b087161ae684efac774508bd9d24b61dd5e.tar.gz"
"ppsspp-sdl.sh"
"ppsspp-headless.sh")
sha256sums=('a465159a66d9514dfb037570ee080b6946b571b72cbcdd0b4b3cbc9b05843161'
            'beedce003bbfa915d7ebbec91adb649bef1f84fb865ae3b72381957bc3bddac2'
            '25f6b9497640690f07dc9a1171f3ee9d6ae7dbe9f6008aa95727a0d1b0da0c5f'
            'e3fe30296832b8fe107d6c901110a37959985777a92c6c5ce811e2b811a94e61'
            '81fdecc5efd17694d257d224f5ed1b5ebc10798590e644105f60d6ef885e78a9'
            'a80f43d7d9891556bb7c03cd05d822dc183a396fc20bc5a4084b1b655874fe5b')

prepare() {
	cd "$srcdir"
	# copy submodules to right location
  cp -rup native-*/* ppsspp-$pkgver/native
  cp -rup ppsspp-lang-*/* ppsspp-$pkgver/lang
  cp -rup ppsspp-ffmpeg-*/linux ppsspp-$pkgver/ffmpeg
  # disable git versioning
  sed 's|find_package(Git)|# &|' -i ppsspp-$pkgver/git-version.cmake
  # reset build folder
  rm -rf build
  mkdir build
}
         
build() {
	cd "$srcdir"
	cd build
  cmake ../ppsspp-$pkgver -DCMAKE_BUILD_TYPE=Release -DHEADLESS=ON
  make
}

package() {
	cd "$srcdir/build"
	install -Dm644 ../ppsspp-$pkgver/LICENSE.TXT "$pkgdir/usr/share/licenses/ppsspp/LICENSE.TXT"
	install -Dm644 ../ppsspp-$pkgver/assets/icon.svg "$pkgdir/usr/share/icons/ppsspp.svg"
	install -Dm644 ../ppsspp-$pkgver/Qt/PPSSPP.desktop "$pkgdir/usr/share/applications/PPSSPP.desktop"
	setconf "$pkgdir/usr/share/applications/PPSSPP.desktop" Exec /usr/bin/ppsspp-sdl
	setconf "$pkgdir/usr/share/applications/PPSSPP.desktop" Icon /usr/share/icons/ppsspp.svg
	install -Dm755 ../ppsspp-sdl.sh "$pkgdir/usr/bin/ppsspp-sdl"
	install -Dm755 ../ppsspp-headless.sh "$pkgdir/usr/bin/ppsspp-headless"
	install -Dm755 PPSSPPSDL "$pkgdir/usr/share/ppsspp/PPSSPPSDL"
	install -Dm755 PPSSPPHeadless "$pkgdir/usr/share/ppsspp/"
	cd assets
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/ppsspp/assets/"{} \;
}
