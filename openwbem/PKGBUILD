# Contributor: Graziano Giuliani <g.giuliani@seco.it>
# Contributor: the_glu 
# Contributor: Stefan Husmann <stefan-husmann@t-online.de> 
pkgname=openwbem
pkgver=3.2.2
pkgrel=4
pkgdesc="Implementation of WBEM (Web Based Enterprise Management)" 
arch=('i686' 'x86_64')
url="http://openwbem.org"
license=('custom:BSD')
depends=('openslp')
source=(http://openwbem.org/license.html automake.patch gcc4.4.patch \
http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7b2ddefc00f40e32529d185c1144b198'
         '6d77397ec78333e741f8edf5f7899084'
         'a9cd871339b84d6db8b1c58d2f55821e'
         'a2a6556d3a58f5d37bd61024c75b4a3a')
backup=('etc/openwbem/openwbem.conf' 'etc/openwbem/ssleay.cnf')
options=('!libtool')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../automake.patch || return 1
  patch -p1 < ../gcc4.4.patch || return 1
  ./configure --prefix=/usr --libexecdir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --localstatedir=/var || return 1
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  DESTDIR=$pkgdir make install || return 1
  install -Dm644 $srcdir/license.html \
    $pkgdir/usr/share/licenses/$pkgname/license.html || return 1
}
