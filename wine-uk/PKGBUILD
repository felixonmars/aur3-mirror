# Archlive <http://archlive-pkg.googlecode.com>
#
#  Transfer unifiedkernel wine for ubuntu package to Arch

pkgname=wine-uk
pkgver=0.2.4.1
pkgrel=1
url="http://www.longene.org/"
pkgdesc="Wine with unifiedkernel patch"
arch=('i686')
license=('GPL2')
depends=("unifiedkernel=$pkgver")
makedepends=('binutils')
provides=("wine=1.0")
conflicts=('wine' 'wine-git')
install=wine.install
source=( unifiedkernel-$pkgver-wine.deb::"http://www.longene.org/fileDownload.php?id=44&page=download"
	)
md5sums=()

build()
{
	cd $srcdir
	ar x *.deb
	tar -xpf data.tar.gz -C $pkgdir/
}
md5sums=('82636e227f89e799c02cb82249f43d33')
