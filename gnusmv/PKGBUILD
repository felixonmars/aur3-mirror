pkgname=gnusmv
pkgver=021002
pkgrel=2
pkgdesc="Graphical user interface for NuSMV"
arch=('i686' 'x86_64')
url="http://nusmv.irst.itc.it/gnusmv/"
license=('LGPL')
depends=('python2' 'libpng' 'pygtk' 'pkg-config' 'zlib' 'gtk2' 'libxml2' 'libglade')
source=(http://nusmv.irst.itc.it/gnusmv/dload/unix/gnusmv-snapshot-021002_linux.tar.gz)
md5sums=('0ef92ec6e37920de93da57e2346a34e0')
optdepends=('nusmv')

build() {
	mkdir -p $pkgdir/opt
	cp -r $srcdir/$pkgname $pkgdir/opt/gnusmv

	mkdir -p $pkgdir/usr/bin
	echo -e "#!/bin/sh\ncd /opt/gnusmv/\npython2 /opt/gnusmv/main.py\ncd -" \
		> $pkgdir/usr/bin/gnusmv
	chmod 755 $pkgdir/usr/bin/gnusmv
}
