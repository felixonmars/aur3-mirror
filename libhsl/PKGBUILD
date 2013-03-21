# Maintainer: Benjamin Chretien <chretien@lirmm.fr>

pkgname=libhsl
pkgver="2011"
pkgrel=1
pkgdesc="A collection of Fortran codes for large scale scientific computation."
arch=(i686 x86_64)
url="http://www.hsl.rl.ac.uk"

# HSL offers 3 types of licence:
# academic, commercial (per seat) and commercial (incorporation)
# See: http://www.hsl.rl.ac.uk/licencing.html
license=('custom:HSL Academic Licence')

depends=()
makedepends=('cmake')
provides=('libhsl')
conflicts=()

# Add the HSL Academic Licence
source=('license.txt' 'CMakeLists.txt')
md5sums=('38f73d0e7e8984cc8eaa5007fc97dae0'
         '874b924a4e6770c1dee727a544ef511e')

# HSL routines are not openly available. One needs to apply for an academic or
# commercial licence on their website.
# See: http://www.hsl.rl.ac.uk/catalogue/

# This PKGBUILD was tested with HSL for IPOPT: http://www.hsl.rl.ac.uk/ipopt/
# This should work with any HSL routine specified.

# !!! Source code location has to be specified by the user !!!
# This is the path to a directory containing every *.f and *.f90 file to
# compile. The search is done recursively.
#_HSL_PATH=

# Build the project
build() {
    # Check if the user provides a source archive
    if [ -z ${_HSL_PATH} ] ; then
        error "Missing user-provided source directory path."
        error "Files have to be provided by the user. See http://www.hsl.rl.ac.uk"
        return 1
    fi

    msg "Running CMake..."

    mkdir -p $srcdir/build && cd $srcdir/build
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DHSL_FILE_DIR=${_HSL_PATH}

    msg "Compiling libhsl..."
    make
}

# Create the package
package() {
    cd $srcdir/build;
    msg "Installing libhsl..."
    make DESTDIR=$pkgdir install
    
    # Copy some Fortran source files to /usr/share/hsl/ since other programs
    # may rely on some of those files
    mkdir -p "$pkgdir/usr/share/hsl"
    cp *.mod "$pkgdir/usr/share/hsl/"
}
