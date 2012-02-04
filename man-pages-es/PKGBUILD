# Contributor: Roman Abreu <romanlx.gmail.com>
pkgname=man-pages-es
pkgver=1.55
_xpkgver=0.8a
pkgrel=2
pkgdesc="Spanish linux man pages"
arch=('i686' 'x86_64')
url="http://ditec.um.es/~piernas/manpages-es/"
license=('custom')
depends=('man')
source=(http://ditec.um.es/~piernas/manpages-es/${pkgname}-${pkgver}.tar.bz2
	http://ditec.um.es/~piernas/manpages-es/${pkgname}-extra-${_xpkgver}.tar.gz)
md5sums=('b71f701dcae827f2f5e4e848c66321fc' '5827f41f77658df17f550b7f8e831432')
build() {
   cd $startdir/src/${pkgname}-${pkgver}

   # Remove already included man pages
   rm man5/passwd.5

   sed -e's&usr/share/man&usr/man&' Makefile > Maketemp
   mv Maketemp Makefile
   make prefix=$startdir/pkg/

   cd $startdir/src/${pkgname}-extra-${_xpkgver}

   # Remove already included man pages
   rm man1/login.1 man1/mc.1 man1/newgrp.1 man1/passwd.1 man1/su.1 man8/vigr.8 man8/vipw.8

   sed -e 's&/usr/man/es&$(prefix)/usr/man/es&' Makefile > Maketemp
   mv Maketemp Makefile
   make prefix=$startdir/pkg/
   # Remove already included man pages
}
