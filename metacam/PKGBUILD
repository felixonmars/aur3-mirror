# Contributor: Jan Blazek <appolito@gmail.com>
pkgname=metacam
pkgver=1.2
pkgrel=1
pkgdesc="Camera Image Meta-Information Reader"
url="http://www.cheeseplant.org/~daniel/pages/metacam.html"
license="GPL"
depends=('libvorbis')
source=(http://www.sourcefiles.org/Graphics/Camera/$pkgname-$pkgver.tar.gz)
md5sums=('b4f557f0df1c3dcca849677b6bc79d24')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m775 $startdir/src/$pkgname-$pkgver/$pkgname $startdir/pkg/usr/bin/$pkgname
}
