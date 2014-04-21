# Maintainer: David Manouchehri <d@32t.ca>

pkgname=pic32prog-svn
_pkgname=$(printf ${pkgname%%-svn})
pkgver=1.96
pkgrel=1
pkgdesc="pic32prog is a utility for loading data into a flash memory of Microchip PIC32 microcontrollers."
arch=('i686' 'x86_64')
url="https://code.google.com/p/pic32prog/"
license=('GPL2')
makedepends=('subversion') 
provides=("${_pkgname}") # There's no stable release right now, but there may be in the future
conflicts=("${_pkgname}")
optdepends=('ejtagproxy-svn')
source=("${_pkgname}::svn+http://${_pkgname}.googlecode.com/svn/trunk/")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "1.$(svnversion)" # I've added the "1." because the author follows that format in --help
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  mkdir -p "$pkgdir/usr/local/bin/"
  cp "${srcdir}/${_pkgname}/pic32prog" "$pkgdir/usr/local/bin/"
}
