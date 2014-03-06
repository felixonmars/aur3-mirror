# Contributor: Nikita Skovoroda <chalkerx@gmail.com>
pkgname=fastflow
pkgver=2.0.0
pkgrel=1
pkgdesc="FastFlow is a multi-cores programming framework."
arch=('any')
url="http://sourceforge.net/projects/mc-fastflow/"
license=('LGPL3' 'GPL2')
source=("http://sourceforge.net/projects/mc-fastflow/files/$pkgname-$pkgver.tar.bz2")
md5sums=('59baf3d8493f9bccebe9ae904e1f83e7')

package() {
	cd $srcdir/$pkgname-$pkgver
	install -d $pkgdir/usr/include
	cp -r ff $pkgdir/usr/include
}
