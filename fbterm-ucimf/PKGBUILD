# Maintainer: Qi Wenmin <qiwenmin@gmail.com>, Mat <matlinuxer2@gmail.com>
pkgname=fbterm-ucimf
pkgver=0.2.9
pkgrel=2
pkgdesc="ucimf ime server for fbterm."
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/ucimf/"
depends=('fontconfig' 'libucimf>=2.3.7' 'fbterm>=1.6')
source=("http://ucimf.googlecode.com/files/fbterm_ucimf-$pkgver.tar.gz")
md5sums=('65b75480aa24e1e67408279c02dda893')

build() {
	cd $startdir/src/fbterm_ucimf-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}
