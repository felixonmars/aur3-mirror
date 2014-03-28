# Maintainer: Splashy <splash at mailoo dot org>
pkgname=deadbeef-qt
pkgver=r53.d7297741328b
pkgrel=1
pkgdesc="Qt based user interface plugin for DeaDBeeF music player."
arch=('i686' 'x86_64')
url='https://bitbucket.org/tonn/deadbeef-qt/wiki/Home'
license=('GPL2')
depends=('qt4' 'deadbeef')
makedepends=('cmake' 'mercurial')
source=("hg+https://bitbucket.org/tonn/deadbeef-qt#branch=experimental")
install='deadbeef-qt.install'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
        mkdir -p "${srcdir}/build"
        cd "${srcdir}/build"
        cmake "${srcdir}/${pkgname}" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
        make clean && make 
}

package() {
        cd "${srcdir}/build" && make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:

