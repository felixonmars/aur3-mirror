pkgname=megatunix
pkgver=0.9.18
pkgrel=1
pkgdesc="Tuning software for the MegaSquirt electronic fuel injection system"
arch=('i686' 'x86_64')
url="http://megatunix.sourceforge.net/"
license=('GPL')
groups=()
depends=('gtkglext' 'flex' 'bison' 'glade' 'libglade')
makedepends=('make' 'gcc' 'cvs' 'gdb' 'automake')
optdepends=()
provides=('megatunix')
conflicts=('megatunix')
install=()
source=(http://downloads.sourceforge.net/project/megatunix/MegaTunix/${pkgver}/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('cdbb38145c2be28921697bd2f7f7017d')



build() {

    tar -xf ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=${pkgdir} install || return 1

}

