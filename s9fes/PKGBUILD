# Maintainer: Hong-Yi Dai <reflectionalist@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=s9fes
pkgver=20141126
pkgrel=1
pkgdesc="Scheme 9 from Empty Space, a portable R4RS Scheme interpreter"
arch=('i686' 'x86_64')
url="http://www.t3x.org/s9fes/"
license=('custom')
depends=('ncurses')
changelog='ChangeLog'
source=("http://www.t3x.org/s9fes/${pkgname}-${pkgver}.tgz")
md5sums=('9ced9f9341b32de56bbf6830e8160883')                                                                                                           

build() {
  cd "$srcdir"/s9

  case "$CARCH" in
    x86_64) make BITS_PER_WORD_64=1 PREFIX=/usr all ;;
    *) make PREFIX=/usr all ;;
  esac
}

package() {
  cd "$srcdir"/s9

  make PREFIX="$pkgdir"/usr install-all

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # documents
  install -dm755 "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 ABOUT README "$pkgdir"/usr/share/doc/"$pkgname"
}

