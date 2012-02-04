# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com

pkgname=gnome-theme-atolm
pkgver=0.75
pkgrel=2
pkgdesc="Atolm theme."
url="http://skiesofazel.deviantart.com/art/Atolm-191381339"
arch=('any')
license=('GPL3')
optdepends=('awoken-icons: recomanded icon set by theme author.')
depends=('gtk-engine-murrine' 'gdk-pixbuf2' 'gtk-engine-equinox')
source=(http://dl.dropbox.com/u/17051717/pkg/atolm_by_skiesofazel-d35xysb.zip)
md5sums=('1d54b3b97bd7c8827d0a7e173edbd170')

_destdir=$pkgdir/usr/share/themes

build() {
	cd $srcdir
	msg2 "Decompressing the inner archive..."
	tar xfz ./Atolm.tar.gz
}

package() {
	cd $srcdir
	mkdir -p $_destdir

	# Ensure directories are accessible by anyone:
	find . -type d -exec chmod 755 '{}' \;

	msg2 "Installing files..."
	cp -r Atolm $_destdir
}

