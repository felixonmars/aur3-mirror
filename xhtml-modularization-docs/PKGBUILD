# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=xhtml-modularization-docs
pkgver=20100729
pkgrel=2
pkgdesc="XHTML Modularization Documentation"
arch=('any')
url="http://www.w3.org/TR/xhtml-modularization/"
license=('W3C')
options=('docs' '!strip')
source=("http://www.w3.org/TR/2010/REC-xhtml-modularization-${pkgver}/xhtml-modularization.tgz")
md5sums=('cf4cadea4da93d20f9689fc468a80e2f')

package(){
  cd "$srcdir/xhtml-modularization-${pkgver}"
  mkdir -p "$pkgdir/usr/share/doc/xhtml-modularization"
  cp -rf * "$pkgdir/usr/share/doc/xhtml-modularization"
}
