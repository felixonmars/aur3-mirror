_gitname=osqoop
pkgname=$_gitname-git
pkgver=1.1.1.12.g6fd876e_18
pkgrel=1
pkgdesc="А multi-platform open source software oscilloscope based on Qt 4"
arch=('i686' 'x86_64')
url="http://gitorious.org/osqoop"
license=('GPL2')
depends=('qt4')
makedepends=('git' 'cmake')
source=("git://gitorious.org/${_gitname}/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git describe --always | sed 's|-|.|g')_$(git rev-list --count HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
