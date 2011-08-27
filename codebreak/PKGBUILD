# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
pkgname=codebreak
pkgver=0.1
pkgrel=1
pkgdesc="A minimalistic CLI logic game"
arch=('i686' 'x86_64')
url="http://houbysoft.com/en/downprog.php#codebreak"
license=('GPL3')
depends=()
source=("http://houbysoft.com/download/codebreak-src.tar.gz")
md5sums=('5480856e41454c42378914fa3e16ca01')

build() {
  cd  $srcdir/$pkgname
  gcc codebreak.c -o codebreak
  install -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m644 README.txt "$pkgdir/usr/share/$pkgname/README"
}
