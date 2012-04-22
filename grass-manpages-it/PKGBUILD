# Maintainer: Marco Curreli <youremail@domain.com>
pkgname=grass-manpages-it
pkgver=1.1
pkgrel=1
pkgdesc="GRASS GIS 6.4 doc: html manuals and manpages in italian language"
arch=('any')
url="https://bitbucket.org/marco.it/grass64-manpages-it"
license=('GPL')
depends=(grass)
makedepends=()
install='grassdoc.install'
changelog=
source=("https://bitbucket.org/marco.it/grass64-manpages-it/downloads/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('61726b2f0078cc066ba9492fe18e26a6')

package() {

  cd "$srcdir"
  mkdir -p $pkgdir$GISBASE
  
  # manuali in formato man e html
  tar zxvf $pkgname-$pkgver.tar.gz -C  $pkgdir$GISBASE

  # in alternativa, solo le manpages
  #tar zxvf $pkgname-$pkgver.tar.gz man -C  $pkgdir$GISBASE

}
# vim:set ts=2 sw=2 et:
