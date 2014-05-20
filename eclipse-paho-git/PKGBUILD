# Maintainer: Clément Guérin <geecko.dev@free.fr>
pkgname=eclipse-paho-git
pkgver=190514
pkgrel=1
pkgdesc='Paho provides scalable open-source implementations of messaging protocols for M2M and IoT.'
arch=('x86' 'x86_64')
url='http://www.eclipse.org/paho/'
license=('EPL')
source=('paho::git://git.eclipse.org/gitroot/paho/org.eclipse.paho.mqtt.c.git')
depends=( )
makedepends=('gcc' 'git')
conflicts=('eclipse-paho')
provides=('eclipse-paho')
md5sums=('SKIP')

build() {
  cd $srcdir/paho

  make
}

package() {
  cd $srcdir/paho

  mkdir -p $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/local/include
  mkdir -p $pkgdir/usr/local/lib
  sudo make DESTDIR="$pkgdir" install
}

pkgver() {
  cd $srcdir/paho
  echo $(git rev-list --count master)
}
