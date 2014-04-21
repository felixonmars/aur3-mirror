# Maintainer: Jan Helbling <jan.helbling@gmail.com>
# Contributor: Jan Helbling <jan.helbling@gmail.com>
pkgname="wbb_notify"
pkgver=git
pkgrel=2
pkgdesc="A Notificationdaemon for Woltlabs burningboard lite"
arch=('i686' 'x86_64')
url="https://github.com/JanHelbling/wbb_notify"
license=('GPL3')
provides=('wbb_notify')
source=("git+${url}.git")
depends=('glibc')
makedepends=('make gcc')
md5sums=('SKIP')

build() {
   cd "${pkgname}"
   make
}

package() {
   cd "${pkgname}"
   make DESTDIR=$pkgdir install
}
