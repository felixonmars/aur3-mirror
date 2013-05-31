# Contributor: Soehartono Hadibowo <matahari AT archlinux DOT us>
pkgname=sicp-info
pkgver=2.neilvandyke4
pkgrel=3
pkgdesc="MIT SICP in Texinfo"
arch=(any)
url="http://www.neilvandyke.org/sicp-texi/"
license=('custom')
depends=('texinfo')
makedepends=('texinfo-legacy')
options=(docs)
install=sicp-info.install
source=(http://www.neilvandyke.org/sicp-texi/sicp.texi.gz
        legalcode.txt)
md5sums=('57105e0883446d0da50f5419c3ca6383'
         '183e5ed18adc3f0da0e6f50a38bd53c3') 

build() {
  cd "$srcdir"

  makeinfo --no-split sicp.texi -o sicp.info
  gzip -9nf sicp.info
}

package() {
  mkdir -p $pkgdir/usr/share/info
  cd "$srcdir"
  install -D -m644 sicp.info.gz $pkgdir/usr/share/info

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -D -m644 legalcode.txt $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
