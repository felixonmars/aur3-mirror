# Contributor: firefoxmmx <firefoxmmx@gmail.com>
pkgname=man-pages-zh
pkgver=1.5.1
pkgrel=2
pkgdesc="Man pages for Chinese"
arch=('i686' 'x86_64')
license="GPL"
url="http://www.kernel.org/doc/man-pages"
depends=('man' 'groff-utf8')
makedepends=('pkgconfig')
source=(http://cn.archive.ubuntu.com/ubuntu/pool/universe/m/manpages-zh/manpages-zh_${pkgver}-1_all.deb)
install=cman.install
md5sums=('dc1ec6afac468fd9e5870b1db75e5818')

build() {
cd $srcdir/
ar vx manpages-zh_${pkgver}-1_all.deb
tar -xvzf data.tar.gz -C $pkgdir/
}
