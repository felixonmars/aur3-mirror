# Maintainer: jordi Cerdan (jcerdan) <jcerdan@tecob.com>
pkgname=libunicapgtk
pkgver=0.9.8
pkgrel=2
pkgdesc="Widget set to build graphical user interface applications with libunicap"
arch=('i686' 'x86_64')
url="http://unicap-imaging.org"
options=('!libtool')
license=('GPL')
depends=('libucil' 'libxv' 'gtk2')
#makedepends=('pkgconfig perlxml')
source=(http://unicap-imaging.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('e68aac64ebf1c8149f9b8009ab855dd0')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1 
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
