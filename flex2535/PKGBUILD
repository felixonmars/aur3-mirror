# $Id$
# Maintainer: Romain Perier <romain.perier@gmail.com>
pkgname=flex2535
_pkgname=flex
pkgver=2.5.35
pkgrel=1
pkgdesc="A tool for generating text-scanning programs"
arch=(i686 x86_64)
url="http://flex.sourceforge.net"
license=('custom')
groups=('base-devel')
depends=('glibc' 'sh')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/flex/flex-$pkgver.tar.bz2 
	lex.sh)
md5sums=('10714e50cea54dc7a227e3eddcd44d57'
         'f725259ec23a9e87ee29e2ef82eda9a5')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info || return 1
  make -j`nproc` || return 1
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  install -D -m755 $startdir/src/lex.sh $pkgdir/usr/bin/lex || return 1
  
  # install license
  install -D -m644 COPYING \
  	$pkgdir/usr/share/licenses/$_pkgname/license.txt || return 1
}
