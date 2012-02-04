# Contributor: Benjamin Bukowski <crankidiot@gmail.com>
pkgname=abx-comparator
pkgver=0.2
pkgrel=2
pkgdesc="GStreamer-based blind audio comparison tool for GNOME"
arch=('i686' 'x86_64')
url="http://abx-comparator.berlios.de/"
license=('GPL')
depends=('pygtk>=2.8' 'python>=2.4' 'gstreamer0.10-python')
source=(abx-comparator.desktop http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d38ac6b9a4561219390c55e9500726a2'
         'c5e10bcbabed4d4dcc6eb15a0460d594')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -m755 -d $pkgdir/opt/abx-comparator
	cp -r ./* $pkgdir/opt/abx-comparator/

  msg "Fixing path"
	sed -i -e 's|abx-comparator.|/opt/abx-comparator/abx-comparator.|g' $pkgdir/opt/abx-comparator/abx-comparator || return 1

  msg "Fixing python2"
  sed -i -e 's|/usr/bin/env python|/usr/bin/env python2|g' $pkgdir/opt/abx-comparator/abx-comparator || return 1

	install -m755 -d $pkgdir/usr/bin
	ln -s /opt/abx-comparator/abx-comparator $pkgdir/usr/bin/abx-comparator

	install -m755 -D ../../abx-comparator.desktop $pkgdir/usr/share/applications/abx-comparator.desktop
}
