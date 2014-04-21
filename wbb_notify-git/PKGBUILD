# Maintainer: Jan Helbling <jan.helbling@gmail.com>
# Contributor: Jan Helbling <jan.helbling@gmail.com>
pkgname="wbb_notify-git"
_gitname="wbb_notify"
pkgver=19042013
pkgrel=1
pkgdesc="A Notificationdaemon for Woltlabs burningboard lite"
arch=('i686' 'x86_64')
url="https://github.com/JanHelbling/${_gitname}"
license=('GPL3')
provides=('wbb_notify')
source=("git+${url}.git")
depends=('glibc')
makedepends=('make gcc')
md5sums=('SKIP')

build() {
   cd "${_gitname}"
   make
}

package() {
   cd "${_gitname}"
   make DESTDIR=$pkgdir install
}
