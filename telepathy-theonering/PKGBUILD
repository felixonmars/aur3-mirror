# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <zauberexonar@gmail.com>
pkgname=telepathy-theonering
pkgver=0.8.24
pkgrel=1
pkgdesc="Plugin that integrates Google Voice with Empathy and Maemo RTComm 4.1 or 5"
arch=('i686' 'x86_64')
url="http://maemo.org/packages/view/telepathy-theonering/"
license=('LGPLv2.1')
depends=('python' 'dbus-python' 'python-telepathy')
makedepends=('deb2targz')
provides=(theonering)
source=(http://theonering.garage.maemo.org/telepathy-theonering.deb)
md5sums=('7475ea66a20d2c7d3923fd0c2f2a61e7')

build() {
  cd $srcdir/
  deb2targz telepathy-theonering.deb
  tar xf telepathy-theonering.tar.gz -C $startdir/pkg
}
