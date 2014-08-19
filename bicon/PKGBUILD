# Maintainer: Bersam Karbasion <bersam.k@gmail.com>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Nezmer <Nezmer@allurelinux.org>
# Contributor: Alexander Stein <archlinux+al@il5.in>
pkgname=bicon
pkgver=0.4
pkgrel=5
pkgdesc="A bidirectional console"
url="https://github.com/behdad/bicon/"
arch=('any')
license=('LGPL')
depends=('fribidi' 'kbd' 'xorg-xkbutils')
options=('!buildflags')
makedepends=('libtool')
source=("https://github.com/behdad/bicon/archive/0.4.tar.gz")
md5sums=('e519b5658ac8f30decb4175d45748342')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-fribidi \
      --mandir=/usr/share/man --with-gtk=2.0,3.0
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" INSTALL="install -p" install
}
