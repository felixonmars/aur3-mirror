# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=dolfin-bzr
pkgver=7434
pkgrel=1
pkgdesc="the C++/Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
arch=(any)
url="https://launchpad.net/dolfin"
license=('LGPL')
groups=('fenics-bzr')
# the package may still build without these dependencies but it wouldn't be
# very useful, most people would want these installed before building
depends=('python2' 'boost' 'openmpi' 'libxml2' 'lapack' 'blas' 'scotch_esmumps' 'hdf5' 'cgal' 'vtk' 'petsc' 'trilinos' 'python2-ply')
#depends=('python2' 'boost' 'libxml2')
makedepends=('bzr' 'cmake' 'swig')
optdepends=('ffc: for the python interface'
            'python2-sphinx: for building documentation')
conflicts=('dolfin')
options=(!emptydirs)
install=dolfin.install

# to stop /common/timing.cpp.o coming before /common/defines.cpp.o
export MAKEFLAGS="-j1"

_bzrtrunk=lp:dolfin
_bzrmod=dolfin

build() {
    # export CFLAGS="$CFLAGS -Wall -Wshadow -Wextra -Werror"
    # export CXXFLAGS="$CXXFLAGS -Wall -Wshadow -Wextra -Werror"

    msg "Connecting to Bazaar server...."

    if [ -d $_bzrmod ]; then
	cd $_bzrmod && bzr pull $_bzrtrunk -r $pkgver && cd ..
	msg "The local files are updated."
    else
	bzr branch $_bzrtrunk $_bzrmod -r $pkgver
    fi

    msg "BZR checkout done or server timeout"
    msg "Starting make..."

    # if using HDF5 version 1.8.10, we need a different FindHDF5.cmake file
    # [ -e /usr/share/cmake/hdf5/FindHDF5.cmake ] && cp /usr/share/cmake/hdf5/FindHDF5.cmake "${_bzrmod}/cmake/modules/"

    [ -d $_bzrmod-build ] && rm -rf $_bzrmod-build && msg "Deleted old $_bzrmod-build"
    cp -r $_bzrmod $_bzrmod-build
    cd $_bzrmod-build
    #patch -Np1 -i "${srcdir}/debug_cxxflags.diff"

    find ./ -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    # sphinx is for making documentation
    sed -i 's/\(sphinx-build[013456789^2]*\)\(.*\)/sphinx-build2\2/g' \
	./cmake/modules/FindSphinx.cmake

    [ -d build ] && rm -rf build
    mkdir build
    cd build

    # get the real path to the python executable, allows for virtualenv setups
    local py2_interp=`python2 -c "import os,sys; print(os.path.realpath(sys.executable))"`
    local py2_inc="${py2_interp/\/bin\///include/}"
    local py2_lib=`ldd ${py2_interp} | grep python | cut -d " " -f 3 | sed 's/\(.*.so\).*/\1/'`

    cmake .. -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
	-DCMAKE_INSTALL_PREFIX=${pkg}/usr \
        -DPYTHON_EXECUTABLE:PATH=${py2_interp} \
        -DPYTHON_INCLUDE_DIR:PATH=${py2_inc} \
        -DPYTHON_LIBRARY:FILEPATH=${py2_lib} \
	-DDOLFIN_ENABLE_VTK=ON \
        -DCMAKE_SKIP_BUILD_RPATH=TRUE \
	-DCMAKE_SKIP_RPATH=TRUE \
	-DCMAKE_BUILD_TYPE="Debug"

    make

    # Uncomment this line for documentation
    #make SPHINXBUILD=sphinx-build2 doc
}

package() {
    cd "$srcdir/$_bzrmod-build/build"
    make install DESTDIR=$pkgdir
}
