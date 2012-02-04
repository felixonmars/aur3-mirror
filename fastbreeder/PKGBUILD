# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=fastbreeder
pkgver=1.0.1
pkgrel=4
pkgdesc="An experimental genetic programming synthesiser."
arch=(i686 x86_64)
url="http://www.pawfal.org/Software/fastbreeder/"
license=('GPL')
depends=('jack' 'liblo' 'python2')
makedepends=('scons')
source=("http://www.pawfal.org/Software/fastbreeder/files/$pkgname-$pkgver.tar.gz")
md5sums=('9d475f99545006df1bcbd52f807245aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  scons
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # server
  install -Dm755 "$pkgname"server \
    "$pkgdir/usr/bin/${pkgname}server"

  # scripts
  install -d "$pkgdir/usr/share/$pkgname"
  install -Dm755 scripts/* doc/notes.txt \
    "$pkgdir/usr/share/$pkgname"

  # bin link
  ln -s "/usr/share/$pkgname/$pkgname" \
    "$pkgdir/usr/bin"

  # python2 fix
  sed -i "s/python/&2/" "$pkgdir/usr/share/$pkgname/$pkgname"
}
