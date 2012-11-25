# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Mantainer: Luis Pablo Gasparotto < lpgasparotto at gmail dot com >
pkgname=tclabc
pkgver=1.3.7
pkgrel=1
pkgdesc="A Tcl interface to the ABC notation and contains a Tk GUI."
arch=(i686 x86_64)
url="http://moinejf.free.fr/"
license=('gpl')
depends=('tcl')
optdepend=('abcm2ps')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#groups=()
#options=()
#install=
source=(http://moinejf.free.fr/${pkgname}-${pkgver}.tar.gz)
#noextract=()
md5sums=('3946e96ee5a41dcf3e73cf14c31ac629')

build() {
  cd $srcdir/${pkgname}-${pkgver}
    ./configure --prefix=/usr --with-tcltk=/usr/lib
	make || return 1
	make DESTDIR=$pkgdir prefix=$pkgdir/usr/ install || return 1
}

