# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=css21-doc
pkgver=20110607
pkgrel=1
pkgdesc="Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification"
arch=('any')
url="http://www.w3.org/Style/CSS/"
license=(custom:"W3C document license")
options=('docs')
source=("http://www.w3.org/TR/2011/REC-CSS2-${pkgver}/css2.tgz")
md5sums=('04ace6edc522fa88231192335559a33b')

build(){
  cd "$srcdir"
  rm "css2.tgz"
  
  # 20110607 CSS2 recommendation images/clip.png wasn't world-readable
  chmod -R a+r .
}

package(){
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc/css21"
  cp -rf * "$pkgdir/usr/share/doc/css21"
}
