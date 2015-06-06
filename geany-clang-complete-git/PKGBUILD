# $Id: PKGBUILD 121066 2014-10-20 13:36:34Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

_pkgbase=geany-clang-complete
pkgname=$_pkgbase-git
pkgver=20150605
pkgrel=1
pkgdesc=' a Geany plugin to provide code completion using clang'
arch=('x86_64' 'i686')
url='https://github.com/notetau/geany-clang-complete'
license=('GPL')
depends=("geany" "clang")
source=("git+https://github.com/notetau/geany-clang-complete.git")
sha256sums=('SKIP')
install=('geany-clang-complete.install')
build() {
  cd "$_pkgbase"

  # Disabling geanypy because it doesn't compile
  # Disabling debugger because it makes geany crash, see FS#42417
  
  make 
}

package() {
  cd "$_pkgbase"
  mkdir -p "$pkgdir"/$(pkg-config --variable=libdir geany)/geany
  make PREFIX="$pkgdir"/$(pkg-config --variable=libdir geany)/geany install
}

# vim:set ts=2 sw=2 et:
