# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 [at] gmail dot com>

pkgname=easystroke-fixed-prefdb
pkgver=0.6.0
pkgrel=2
pkgdesc="easystroke with patched prefdb.cc in order to keep input mehtod persistent"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/easystroke/"
license=('ISC License')
depends=('boost-libs' 'dbus-glib' 'gtkmm3' 'libxtst' 'xorg-server')
makedepends=('boost' 'gettext' 'help2man' 'inputproto' 'intltool' 'xorg-server-devel')
conflicts=('easystroke')
provides=('easystroke')
source=("http://sourceforge.net/projects/easystroke/files/easystroke/0.6.0/easystroke-0.6.0.tar.gz"
	"prefdb.cc.patch")
sha512sums=('a74cbdfd2b56e6b20d895297e80fb63f3d8ac938235ecf7067f984d087004af22a5ea0116ae20b948e238b02a06b14044a7025d65840f0c8d00542332387c921'
            'b5100015cdac8933415418abaf3e75b0a82331cd3acf984dd444c63749a1be2441279cfb13e87318fea6d2c73e436d890dbd9ba3dcfb0d1a479313d5c74e95ba')
install=$pkgname.install

prepare() {
	cd $srcdir
	patch easystroke-$pkgver/prefdb.cc < prefdb.cc.patch
}

build() {
	cd $srcdir/easystroke-$pkgver
	make man
}

package() {
	cd $pkgdir

        mkdir -p usr/bin
        mkdir -p usr/share/applications
        mkdir -p usr/share/icons/hicolor/scalable/apps
        mkdir -p usr/share/licenses/easystroke
        for d in $srcdir/easystroke-$pkgver/po/*/; do
    		mkdir -p usr/share/locale/$(basename $d)/LC_MESSAGES
	done
	mkdir -p usr/share/man/man1

	install -m0755 $srcdir/easystroke-$pkgver/easystroke usr/bin
	install -m0644 $srcdir/easystroke-$pkgver/easystroke.desktop usr/share/applications
	install -m0644 $srcdir/easystroke-$pkgver/easystroke.svg usr/share/icons/hicolor/scalable/apps
	install -m0644 $srcdir/easystroke-$pkgver/LICENSE usr/share/licenses/easystroke
        for d in $srcdir/easystroke-$pkgver/po/*/; do
                install -m0644 $d/LC_MESSAGES/easystroke.mo usr/share/locale/$(basename $d)/LC_MESSAGES
	done
	install -m0644 $srcdir/easystroke-$pkgver/easystroke.1 usr/share/man/man1
        
}
