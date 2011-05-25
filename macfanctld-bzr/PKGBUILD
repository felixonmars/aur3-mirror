# Maintainer : Samuel Mathieson <smathieson at gmail dot com>

pkgname=macfanctld-bzr
pkgver=1
pkgrel=3
arch=(i686 x86_64)
pkgdesc="Fan controll for intel macs."
url="https://launchpad.net/macfanctld"
license="GPL"
makedepends=('gcc' 'bzr')
depends=('glibc')
conflicts=('macfanctld')
backup=('etc/macfanctl.conf')
install='macfan.install'

build() {
	msg $srcdir
	msg $pkgdir
    cd $srcdir
    msg "Downloading code from launchpad...."
    bzr branch lp:macfanctld
    msg "Making macfanctld..."
    cd macfanctld
    make
	msg "Packaging..."
	cd $pkgdir
	mkdir etc
	mkdir -p usr/bin
	cp $srcdir/macfanctld/macfanctld $pkgdir/usr/bin/
	cp $srcdir/macfanctld/macfanctl.conf $pkgdir/etc/
}
