# $Id$
# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kdeplasma-applets-qstardict
pkgver=1.0.1
pkgrel=1
pkgdesc="Qstardict applet and dataengine for KDE plasma"
arch=('i686' 'x86_64')
url="http://qstardict.ylsoftware.com/index.php"
license=('GPL2')
depends=('kdebase-workspace' 'qstardict')
makedepends=('cmake' 'automoc4')
source=(http://qstardict.ylsoftware.com/files/qstardict-$pkgver.tar.bz2)
sha256sums=('b778ace65a22e5b9724d687ad90c77ec98feb2671774f73cd51725ec7b59e62f')
       #     '6be60d04c51bd52fb4b777087df78ec2fa879345ec83afc5c3c95c2f46e3cbd6')

build() {
  cd qstardict-$pkgver/kdeplasma
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qstardict-$pkgver/kdeplasma/build

  make DESTDIR=${pkgdir} install
}
