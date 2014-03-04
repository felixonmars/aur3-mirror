# Maintainer: Janosch Dobler <janosch.dobler [at} gmx [dot} de>
pkgname=write
pkgver=194
pkgrel=1
pkgdesc="Write - A word processor for handwriting"
arch=(i686 x86_64)
url="http://www.styluslabs.com/"
license=('custom')
depends=(qt4 libpng12)
optdepends=()
provides=('writer')
if [[ $CARCH == 'x86_64' ]]; then
  depends=(lib32-qt4 lib32-libpng12)
fi
source=("http://www.styluslabs.com/write/write${pkgver}.tar.gz")
md5sums=('19530097bdbfb8f118424e2a372c7b59')


package() {

  install -Dm755 "$srcdir/Write" "$pkgdir/usr/bin/writer"
}

# vim:set ts=2 sw=2 et:
