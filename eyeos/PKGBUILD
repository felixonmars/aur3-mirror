# Maintainer : Semitsgolou-Tsiapos Dimitrios <madcatmk254[at]gmail[dot]com>
# Contributer: Jonny Gerold <jonny@fsk141.com>

pkgname=eyeos
pkgver=2.5
pkgrel=1
pkgdesc="An Open Source Web Desktop Environment. Requires a webserver with PHP support to be installed."
arch=("i686" "x86_64")
url="http://eyeos.org/"
depends=('php' 'php-sqlite')
license=('AGPLv3')
source=(http://mirror.transact.net.au/pub/sourceforge/e/project/ey/eyeos/eyeos2/eyeos-$pkgver.tar.gz eyeos.install)
md5sums=('42cebcbd4c4f5c112124a6d48e0c0ee0'
	 '4da3d46addfe652380bc694b2043e73f')
install=eyeos.install

build() {

	mkdir -p $pkgdir/usr/share/$pkgname
	cp -ra $srcdir/eyeos/* $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp -ra $srcdir/resource/* $pkgdir/usr/share/doc/$pkgname
}
