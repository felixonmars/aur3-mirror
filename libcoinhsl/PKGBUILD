# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=libcoinhsl
pkgver="2014.01.10"
pkgrel=1
pkgdesc="A number of HSL linear solvers that can be used in IPOPT"
arch=(i686 x86_64)
url="http://www.hsl.rl.ac.uk/ipopt/"

# HSL offers 3 types of licence:
# academic, commercial (per seat) and commercial (incorporation)
# See: http://www.hsl.rl.ac.uk/licencing.html
license=('custom:HSL Academic Licence')

depends=('metis4')
provides=('libcoinhsl')

# !!! Source code location has to be specified by the user !!!
_COINHSL_PATH="."
_COINHSL_NAME="coinhsl-${pkgver}"

# Add the HSL Academic Licence
source=("license.txt" "${_COINHSL_PATH}/${_COINHSL_NAME}.tar.gz")
md5sums=('38f73d0e7e8984cc8eaa5007fc97dae0'
         'cbf6ae13721bed05434a4bf5f6697f41')

# HSL routines are not openly available. One needs to apply for an academic or
# commercial licence on their website.
# See: http://www.hsl.rl.ac.uk/catalogue/

# This PKGBUILD was tested with HSL for IPOPT: http://www.hsl.rl.ac.uk/ipopt/

build() {
    # Check if the user provides a source archive
    if [ -z ${_COINHSL_PATH} ] ; then
        error "Missing user-provided archive name"
        error "Files have to be provided by the user. See http://www.hsl.rl.ac.uk"
        return 1
    fi

    cd ${srcdir}/${_COINHSL_NAME};

    msg "Configuring installation..."
    ./configure --prefix=/usr --disable-static LIBS=-lmetis-4

    msg "Compiling libcoinhsl..."
    make -j1
}

package() {
    cd ${srcdir}/${_COINHSL_NAME};
    msg "Installing libcoinhsl..."
    make DESTDIR=${pkgdir} install

    # Copy some Fortran source files to /usr/share/coin/libcoinhsl since
    # Ipopt rely on some of those files (e.g. hsl_ma77_double.mod)
    mkdir -p "$pkgdir/usr/share/coin/libcoinhsl"
    cp *.mod "$pkgdir/usr/share/coin/libcoinhsl/"

    # Copy the license in /usr/share
    install -m644 -D ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
