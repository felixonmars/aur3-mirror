# Maintainer:  bmpvieira <mail AT bmpvieira DOT com>
# Contributor: bmpvieira <mail AT bmpvieira DOT com>
pkgname=ima2
pkgver=4.5.10
pkgrel=1
pkgdesc="A program for fitting the isolation with migration model for multiple populations."
arch=('i686' 'x86_64')
url="http://genfaculty.rutgers.edu/hey/software"
license=('GPL')
depends=('glibc')
source=(http://lifesci.rutgers.edu/~heylab/ProgramsandData/Programs/IMa2/${pkgname}-${pkgver}.tar.gz)
md5sums=('85b8bcd98baf7bfffb8f6e1b8a8b0206')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
