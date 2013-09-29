# Maintainer: Marco Milch <marco.milch@freenet.de>

pkgname=quick2wire-gpio-admin-git
_gitname=quick2wire-gpio-admin-git
_realname=gpio-admin
pkgver=0.53.03eb8c2
pkgrel=1
pkgdesc="A command-line tool to export or unexport the Raspberry Pi's GPIO pins."
arch=(armv6h)
url="https://github.com/quick2wire/quick2wire-gpio-admin"
license=('MIT' 'LGPL')
makedepends=('git')
options=('!emptydirs' '!strip')
provides=('quick2wire-gpio-admin')
conflicts=('quick2wire-gpio-admin')
replaces=('quick2wire-gpio-admin')
source=("$pkgname::git+https://github.com/quick2wire/quick2wire-gpio-admin.git"
        "Makefile.patch")
sha256sums=('SKIP'
            '44ec112ad11f9871499a93e59aa7e59bcb0bb1583ef3f2cdc594454091d57213')

pkgver() {
  cd "$pkgname"

  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${_gitname}
  
  patch -uN Makefile ../Makefile.patch
  
}

package() {
  cd ${_gitname}
 
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
