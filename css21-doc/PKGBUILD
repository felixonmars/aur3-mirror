# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=css21-doc
pkgver=20090908
pkgrel=1
pkgdesc="Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification"
arch=('any')
url="http://www.w3.org/Style/CSS/"
license=('W3C')
options=('docs')
source=("http://www.w3.org/TR/CSS21/css2.tgz")
md5sums=('48d9d41f5664b4f64a37900899ae7572')

build(){
  cd "$srcdir"
  rm css2.tgz
  mkdir -p "$pkgdir/usr/share/doc/css21" || return 1
  cp -rf * "$pkgdir/usr/share/doc/css21" || return 1
}
