# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-qt5-xmlpatterns-git
pkgver=v5.1.0.beta1.5.gb3aa3fe
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtXmlPatterns)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('kf5-qt5-base-git')
makedepends=('git')
provides=('kf5-qt5-xmlpatterns')
options=('!libtool')
source=(git://gitorious.org/qt/qtxmlpatterns.git)
md5sums=('SKIP')

pkgver() {
  cd qtxmlpatterns
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qtxmlpatterns
  git checkout dev
}

build() {
  export QT_SELECT=kf5

  cd qtxmlpatterns
  qtchooser -run-tool=qmake
  make
}

package() {
  cd qtxmlpatterns
  make INSTALL_ROOT="${pkgdir}" install
}
