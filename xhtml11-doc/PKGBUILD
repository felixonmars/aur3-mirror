# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=xhtml11-doc
pkgver=20101123
pkgrel=2
pkgdesc="XHTML 1.1 Documentation"
arch=('any')
url="http://www.w3.org/TR/xhtml11"
license=('W3C')
depends=("xhtml-modularization-docs")
options=('docs' '!strip')
source=("http://www.w3.org/TR/2010/REC-xhtml11-${pkgver}/xhtml11.tgz")
md5sums=('56366fb9ff58b79a2de71f127b9baf76')

build(){
  cd "$srcdir/xhtml11-${pkgver}"
  sed -i 's%http://www.w3.org/TR/xhtml-modularization/%../xhtml-modularization/%g' *.html
}

package() {
  cd "$srcdir/xhtml11-${pkgver}"
  mkdir -p "$pkgdir/usr/share/doc/xhtml11"
  cp -rf * "$pkgdir/usr/share/doc/xhtml11"
}
