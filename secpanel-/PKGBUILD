# Maintainer: vmalloc support@cyborg-connect.de
# Contributor: enderst <enderst@gmail.com>
# The PKGBUILD and install files are based upon those created by enderst <enderst@gmail.com>
# Download URL changed
pkgname=secpanel-
pkgver=0.6.1
pkgrel=4
pkgdesc="Graphical frontend for managing and running SSH and SCP connections"
arch=('i686' 'x86_64')
url="http://themediahost.de/secpanel"
license=('GPL')
depends=('openssh' 'tcl' 'tk')
source=(http://downloads.sourceforge.net/secpanel/files/secpanel-$pkgver.tgz)

md5sums=('c94e598bc66d38421333b74a28abaa17')



package() {
	mkdir -p $pkgdir/usr/{bin,lib}
	cp -r $srcdir/usr/local/lib/secpanel $pkgdir/usr/lib/
	install -D -m755 $srcdir/usr/local/bin/secpanel $pkgdir/usr/bin/secpanel
}
