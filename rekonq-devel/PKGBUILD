# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net>
# Contributor: Emeric Letavernier <emeric.letavernier AT laposte DOT net>

_pkgname=rekonq
pkgname=$_pkgname-devel
pkgver=1.80
pkgrel=1
pkgdesc='A WebKit based web browser for KDE - unstable development snapshot'
arch=('i686' 'x86_64')
url='http://rekonq.kde.org/'
license=('GPL')
depends=('kdebase-keditbookmarks' 'qoauth')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
provides=('rekonq')
conflicts=('rekonq' 'rekonq-git')
install=${_pkgname}.install
source=("https://downloads.sourceforge.net/project/${_pkgname}/2.0/${_pkgname}-${pkgver}.tar.bz2")

# Alternative source line for git snapshot checkouts
#source=("$_pkgname-$pkgver.tar.bz2::http://quickgit.kde.org/index.php?p=scratch%2Fadjam%2Frekonq2.git&a=snapshot&h=96a7e48fb9460204cf75740ba50fc5ac5b61038b&fmt=tbz2")

sha256sums=('8fd8ae4d3feb6ab2dc497dc7f6a27d4ca72d1330dceb9a37da4106af2f7af5d3')

build(){
  cd ${srcdir}

  # Needed for git checkouts only:
  #mv scratch-adjam-rekonq2 ${_pkgname}-${pkgver}

  mkdir build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
