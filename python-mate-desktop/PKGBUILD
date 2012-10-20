#Mantainer: Giovanni "Talorno" Ricciardi <kar98k.sniper@gmail.com>
#Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-mate-desktop
pkgver=1.4.0
pkgrel=2
pkgdesc=""
arch=('i686' 'x86_64')
url="http://mate-desktop.org"
license=('GPL')
groups=()
depends=('python2' 'libmate' 'libmateui' 'python2-cairo' 'glib2' 'gtk2'
         'librsvg' 'libgtop' 'libwnck' 'mate-panel' 'mate-media' 'mate-conf'
         'mate-window-manager' 'mate-common' 'libmatekeyring' 'mate-desktop'
         'gstreamer0.10-base' 'dbus' 'dbus-glib' 'avahi' 'libgcrypt')
source=(http://pub.mate-desktop.org/releases/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
options=(!libtool)

build() {
	export PYTHON=python2
	cd "${srcdir}/${pkgname}-$pkgver"
	./autogen.sh --disable-static --enable-applet --enable-cajaburn --enable-matekeyring --enable-matedesktop --enable-mateprint --enable-mateprintui --enable-marco --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var --disable-static
}

package() {
	cd "${srcdir}/${pkgname}-$pkgver"

	make DESTDIR="$pkgdir" install || return 1
	rm $pkgdir/usr/lib/python2.7/site-packages/gtk-2.0/rsvg.so
}
sha256sums=('d9629eb2b589d3a65246625ddca2f568ce78c782335fb48537e3f9d37cc32a5e')
