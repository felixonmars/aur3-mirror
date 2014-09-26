pkgname=vera
pkgver=1.22
pkgrel=2
pkgdesc="A list of computer related acronyms (Info format)"
arch=(any)
url="http://home.snafu.de/ohei/vera/vueber-e.html"
license=('FDL')
install=vera.install
depends=('texinfo')
source=(http://ftp.gnu.org/gnu/vera/vera-$pkgver.tar.gz{,.sig}
        vera.patch)
md5sums=('13ede7df6e59397b6a432d32890785da'
         'SKIP'
         '87abb5868c27f8edb6a6ec20cd53a5b7')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np0 -i ../vera.patch
}

build() {
  cd "$pkgname-$pkgver"
  makeinfo --no-split --force vera.texi
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m 644 vera.info "$pkgdir"/usr/share/info/vera.info
}
