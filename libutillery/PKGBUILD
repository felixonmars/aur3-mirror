# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=libutillery
pkgver=1.6.2
pkgrel=1
pkgdesc="A lightweight and thoroughly documented collection of sub-libraries that solve generic and often repetitive tasks."
arch=('i686' 'x86_64')
url="http://projects.kolabore.org/$pkgname/"
license=('custom')
depends=('openssl')
changelog=ChangeLog
options=('!libtool')
source=(https://svn.mrsserver.net/pub/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8eacae8d41038707fbf71677bf9a014c')

build() {
  cd $srcdir/$pkgname-$pkgver
  unset LDFLAGS
  ./configure --prefix=/usr --enable-static=no
  make

}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
