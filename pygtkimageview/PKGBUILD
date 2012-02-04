# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>
pkgname=pygtkimageview
pkgver=1.2.0
pkgrel=1
pkgdesc="Set of Python bindings for GtkImageView"
arch=('i686' 'x86_64')
url="http://trac.bjourne.webfactional.com/"
license=('LGPL')
depends=('gtkimageview')
makedepends=('pkgconfig')
source=(http://trac.bjourne.webfactional.com/attachment/wiki/WikiStart/$pkgname-$pkgver.tar.gz?format=raw)
md5sums=('469a2385e56b29e0656d0721fc871857')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}

