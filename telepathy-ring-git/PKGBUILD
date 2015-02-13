# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=telepathy-ring-git
pkgver=20150212
pkgrel=1
pkgdesc="GSM/UMTS+ support for telepathy, git edition"
arch=('i686' 'x86_64')
url="https://gitorious.org/meego-cellular/telepathy-ring"
license=('LGPL2.1')
#groups=('telepathy')
depends=('ofono' 'telepathy-glib')
makedepends=('git' 'check')
provides=('telepathy-ring')
conflicts=('telepathy-ring')
source=("git://gitorious.org/meego-cellular/telepathy-ring.git" "pyver.patch")
sha256sums=('SKIP'
            'e76b8865b5423a8c0187a5eb0fd9472dc700615b42290da9c0076b2d271d8a21')

_gitroot="https://git.gitorious.org/meego-cellular/telepathy-ring.git"
_gitname="telepathy-ring"

build() {

  cd "$srcdir/$_gitname"
  #
  # BUILD HERE
  #
  patch -p1 -i ../pyver.patch configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
pkgver() {
  date +%Y%m%d
  #cd "$srcdir/$_gitname"
  #git describe --always | sed 's|-|.|g'
}
# vim:set ts=2 sw=2 et:
