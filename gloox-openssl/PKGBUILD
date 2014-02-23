# Mainta:qiner: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: William Rea <sillywilly@gmail.com>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

pkgname=gloox-openssl
pkgver=0.9.9.12
pkgrel=1
pkgdesc="C++ libraries for development of Jabber client/component/server compiled with openssl"
arch=(i686 x86_64)
url="http://camaya.net/gloox"
options=('!libtool')
license=("GPL")
depends=('libidn' 'openssl')
conflicts='gloox'
provides='gloox'

source=(http://camaya.net/download/gloox-$pkgver.tar.bz2)
md5sums=('2205cc560e72cd996adf2ec91ae39fc2')

build() {
  cd $srcdir/gloox-$pkgver
  ./configure --prefix=/usr --with-openssl --without-gnutls
  make
}

package() {
  cd $srcdir/gloox-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:set ts=2 sw=2 et:
