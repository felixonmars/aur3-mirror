# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=schafkopf-git
pkgver=517.58c9cc2
pkgrel=1
pkgdesc="KDE port of a Popular Bavarian card game also known as Sheepshead in parts of the USA."
arch=('i686' 'x86_64')
url="https://github.com/benni0815/SchafKopf"
license=('GPL2')
depends=('kdebase-runtime' 'libkdegames' 'qimageblitz')
makedepends=('automoc4' 'cmake' 'git')
source=('git+git://github.com/benni0815/SchafKopf.git')
md5sums=('SKIP')

prepare() {
   cd $srcdir/SchafKopf
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 -DINSTALL_OPEN_TAROCK=ON
}

build() {
   cd $srcdir/SchafKopf
   make
}

package() {
   cd $srcdir/SchafKopf
   make DESTDIR=$pkgdir install
}

pkgver() {
   cd $srcdir/SchafKopf
   echo $(git rev-list --count master).$(git rev-parse --short master)
}