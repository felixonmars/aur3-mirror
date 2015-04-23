# Maintainer: Edouard LAFON <contact *AT* edouard-lafon *DOT* fr>
pkgname=ludc-git
_pkgname=lud
pkgver=20140928
pkgrel=4
pkgdesc="OpenUDC console client - git version"
arch=('i686' 'x86_64')
url="http://openudc.org"
license=('GPL2')
depends=('bash' 'gnupg')
source=("git://github.com/Open-UDC/lud.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}


