# Maintainer: Brieuc Roblin <brieuc dot roblin at gmail dot com>

pkgname=ptbatterysystemtray
pkgver=1.0.0.rc2
pkgrel=2
pkgdesc="A simple battery monitor in the system tray using UPower and UCpufreq, in Qt"
url="http://www.pyrotools.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'dbus-core' 'upower')
makedepends=('make')
optdepends=('ucpufreq')
provides=('ptbatterysystemtray')
source=("git://gitorious.org/$pkgname/$pkgname.git")
#md5sums=('591d297777a510a722a3301ff8a6caa1')
md5sums=(SKIP)

build() {
  cd $srcdir/$pkgname
  qmake-qt4 "INSTALL_PREFIX=/usr"
  make
}

package() {
  cd $srcdir/$pkgname
  make "INSTALL_ROOT=$pkgdir" install
}
