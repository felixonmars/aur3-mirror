# Contributor: tantalum <tantalum at online dot de>
pkgname=gucu
pkgver=0.7
pkgrel=1
pkgdesc='Guile bindings for the GNU NCurses library'
arch=(i686 x86_64)
license=(custom)
depends=(guile ncurses)
url=http://gano.sourceforge.net/
source=(http://downloads.sourceforge.net/project/gano/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(fdff7f02ee7592258042bc655142d5da)

build() {
 cd ${srcdir}/${pkgname}-${pkgver}

 ./configure --prefix=/usr || return 1
 make && make DESTDIR=${pkgdir} install || return 1

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info/dir ]; then
  rm ${pkgdir}/usr/share/info/dir
 fi
}
