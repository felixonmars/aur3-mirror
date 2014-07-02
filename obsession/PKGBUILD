# maintainer: mimas <mimasgpc@free.fr>

pkgname=obsession
pkgver=20140608
pkgrel=1
pkgdesc="Openbox session tools"
arch=('i686' 'x86_64')
url=https://bitbucket.org/fabriceT/obsession
license=('GPL')
depends=('glib2' 'gtk2' 'dbus' 'systemd')
makedepends=('vala')
optdepends=('xlock' 'lxdm' 'gdm')
source=(https://bitbucket.org/fabriceT/obsession/downloads/$pkgname-$pkgver.tar.bz2)
sha256sums=('7c34e1b42fad20d5b89f63d3fcc55c39b01e3b2d1c48042c610697f7f7559ff3')

build() {
  cd $pkgname-$pkgver
  make configure PREFIX=/usr/
  make
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="${pkgdir}/usr"
}


