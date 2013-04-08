# Contributor: marcinfa <marcinfa@gmail.com>

pkgname=kdeplasma-applets-activeapp-git
pkgver=0.9.5f16162
pkgrel=1
pkgdesc="A KDE plasmoid that just shows active application's icon and name"
arch=('i686' 'x86_64')
url="http://gitorious.org/active-app"
license=('GPL')
depends=('kdebase-workspace')
conflicts=('active-app-plasmoid' 'kdeplasma-applets-activeapp')
provides=('active-app-plasmoid')
makedepends=('cmake' 'automoc4' 'libxtst')
source=("git+https://git.gitorious.org/active-app/active-app.git")
md5sums=('SKIP')
_gitname="active-app"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)" | sed "s|-|.|g"
}

build() {
  cd ${srcdir}/active-app
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DQT_QMAKE_EXECUTABLE=qmake4
  make
}

package() {
  cd ${srcdir}/active-app/build
  make DESTDIR="$pkgdir" install
}
