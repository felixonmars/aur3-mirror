# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=ido
pkgname=ido3
pkgver=0.3.4
pkgrel=1
pkgdesc="Widgets and other objects used for indicators (GTK+ 3 library)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ido"
license=('LGPL')
depends=('gtk3')
options=('!libtool')
source=(http://launchpad.net/ido/0.3/$pkgver/+download/$_pkgbase-$pkgver.tar.gz)
md5sums=('8853b5ca54f1bc6f2a49f3423ea03b25')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgbase \
              --disable-static
  make
}

package(){
  cd "$srcdir/$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir/" install
}
