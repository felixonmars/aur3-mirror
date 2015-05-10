pkgname=d2x-xl
pkgver=1.18.0
pkgrel=2
pkgdesc="D2X is a port of Descent 2 to OpenGL. It is an open source project and has received a lot of enhancements compared to Descent 2."
arch=(i686 x86_64)
url="http://www.descent2.de"
license=("GPL")
depends=(openmotif sdl_image sdl_mixer sdl_net mesa directfb)
makedepends=(p7zip dos2unix)
source=("http://www.descent2.de/files/$pkgname-src-$pkgver.7z"
"$pkgname.desktop")
sha1sums=('0d666e88e6ea155adc665d72f2dd86015d8bd169'
          'ee0a5910b27276a502e3819d19738ededf1fd74d')

prepare() {
	7z x -y "d2x-xl-makefiles.7z"
	find . -type f -exec dos2unix {} \;
	sed -i -e "s,gameStates.app.cheats.bEnabled = 1,gameStates.app.cheats.bEnabled = 0," \
		-e "s,LOCALPLAYER.score = 0,//LOCALPLAYER.score = 0," main/cheats.cpp
	sed -i "s,/usr/local/games,/opt," main/gamefolders.cpp
	sed -i "s,/usr/local/share/games,/opt," src/conf.h
	chmod +x autogen.sh
}

build() {
	export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing -fpermissive"
	./autogen.sh --prefix=/usr
	chmod +x configure
	./configure \
		--prefix=/usr \
		--enable-release \
		--enable-debug \
		--disable-sdltest \
		--with-opengl \
		--with-sharepath=/opt/d2x-xl
	make
}

package() {
	install -Dm755 $pkgname "$pkgdir/opt/$pkgname/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 resources/$pkgname-icon-64x64.png "$pkgdir/usr/share/icons/$pkgname.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p -m774 "$pkgdir/var/cache/$pkgname"
}
# vim:syntax=sh

