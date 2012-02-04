pkgname=trackpoint
pkgver=1.0
pkgrel=2
pkgdesc="Init script for setting trackpoint values on Thinkpad laptops"
arch=('i686' 'x86_64')
url="http://kenji.ifrit.eu/trackpoint.php"
license=('LGPL')
depends=('bash')
backup=('etc/conf.d/trackpoint')
source=("http://pub.ifrit.eu/projects/trackpoint/$pkgname-$pkgver.tar.gz")
md5sums=('adfaed859250197ab13ac7f179dde47c')
install="trackpoint.install"

build() {
	cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/
}
