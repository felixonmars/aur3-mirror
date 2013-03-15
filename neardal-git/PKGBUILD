# Maintainer: Dmytro Bagrii <dimich@softerra.com>

pkgname=neardal-git
pkgver=20130315
pkgrel=1
pkgdesc="Intel's Neard Abstraction Library"
arch=('i686' 'x86_64')
url="https://01.org/linux-nfc/"
license=('GPL2')
depends=('neard')
makedepends=('automake' 'autoconf>=2.60' 'git')

_gitroot="git://github.com/connectivity/neardal.git"
_gitname="neardal"

build() {
  cd "$srcdir"

  git clone "${_gitroot}"

  cd "${_gitname}"

  ./autogen.sh

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="$pkgdir/" install
}
