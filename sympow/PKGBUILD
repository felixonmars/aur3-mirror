# Maintainer: Antonio Rojas <nqn76sw@gmail.com>

pkgname=sympow
pkgver=1.018.1
pkgrel=1
pkgdesc="A a package to compute special values of symmetric power elliptic
curve L-functions"
arch=('i686' 'x86_64')
url="http://www.sagemath.org"
license=('GPL')
depends=()
source=("http://www.sagemath.org/packages/upstream/$pkgname/$pkgname-$pkgver.tar.bz2" 'sympow')
md5sums=('b6cbb7488870d70d92d11176049cb91b'
         'd829a6bafec955315fc00ae44c76186e')

build() {
  cd $pkgname-$pkgver

  ./Configure
  make
}

package() {
  cd $pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/lib/sympow
  mv sympow *.gp new_data datafiles "$pkgdir"/usr/lib/sympow

  cd "$pkgdir"/usr/lib/sympow/datafiles

  for file in *.txt; do
    ../sympow -txt2bin "$(grep -c AT $file)" <$file ${file/txt/bin}
  done

  mkdir -p "$pkgdir"/usr/bin
  install -m755 $srcdir/sympow "$pkgdir"/usr/bin
}
