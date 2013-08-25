# Maintainer: Boqun Feng <boqun.feng@gmail.com>
pkgname=petite
pkgver=8.4
pkgrel=1
epoch=
pkgdesc="A High-speed Scheme interpreter (threaded version)"
arch=('x86_64' 'i686')
url="http://scheme.com/petitechezscheme.html"
license=('custom')
groups=()
if [ $(uname -m) = 'x86_64' ]
then
    source=("http://scheme.com/download/pcsv$pkgver-ta6le.tar.gz")
    md5sums=('9b1fe15a38bf5c3bd9baab57f2eda78a')
else
    source=("http://scheme.com/download/pcsv$pkgver-ti3le.tar.gz")
    md5sums=('aa5a9931d462fe611f286d77fc98e878')
fi

build() {
  cd "$srcdir/csv$pkgver/custom"
  ./configure --threads --temproot=$pkgdir
}

package() {
  cd "$srcdir/csv$pkgver/custom"
  make install
}

# vim:set ts=2 sw=2 et:
