# TVMET
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=tvmet
pkgver=1.7.2
pkgrel=1

pkgdesc="Tiny Vector and Matrix mathematical template library"
url="http://sourceforge.net/projects/tvmet/"
license=('LGPL')

source=("http://downloads.sourceforge.net/tvmet/tvmet-${pkgver}.tar.bz2")
md5sums=('8e1b2ec67ebec65f680a8bd3ea38a656')

arch=('i686' 'x86_64')

makedepends=('cppunit' 'gcc')

build() {

	# Enter the unpacked archive
	cd "${srcdir}/${pkgname}-${pkgver}"

        # Create a build directory
        mkdir -p "${pkgname}-build" && cd "${pkgname}-build"

        # Configure the package
        ../configure --prefix=/usr \
		     --sysconfdir=/etc \
		     --localstatedir=/var \
		     --enable-optimize || return 1

        # Make the package
        make || return 1

	# Sanity check
	make check || return 1

        # Install the package to the fakeroot directory
        make DESTDIR=${pkgdir} install || return 1
}
