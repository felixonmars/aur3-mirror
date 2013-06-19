# Contributor: Evilandi666 <evilandi.aur(at)googlemail.com>
# Maintainer: Marcel Huber <marcelhuberfooatgmaildotcom>
pkgname=hxtools
pkgver=20130605
pkgrel=2
pkgdesc="A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project."
arch=('i686' 'x86_64')
url=http://inai.de/projects/hxtools/
license=('GPL3')
depends=('libhx>=3.15' perl util-linux pciutils libxcb)
makedepends=('sed')
source=(http://jftp.inai.de/hxtools/hxtools-$pkgver.tar.xz README.md)
sha256sums=('89a14740e7709a5c4e558918044d67c4074c6f63dc6050ec74629fb8a4431445'
            '5d84468a53ada296e36eb060125bfab0a6c4ab7c7200e4e22af5bf98ba2d68e4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --libexecdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
