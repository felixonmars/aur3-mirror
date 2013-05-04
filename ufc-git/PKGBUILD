# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufc-git
pkgver=20130501
pkgrel=1
pkgdesc="A unified framework for finite element assembly."
_branch=master
arch=(any)
url="https://bitbucket.org/fenics-project/ufc"
license=('LGPL')
groups=('fenics-git')
depends=('python2') # 'boost' 'swig')
makedepends=('git' 'python2')
provides=('ufc')
conflicts=('ufc')
options=(!emptydirs)
source=("ufc::git+https://bitbucket.org/fenics-project/ufc.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
    cd ufc
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
    cd ufc
    # replace python with python2 everywhere
    find ./ -name "*" -type f -exec \
        sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;
}

build() {
    cd ufc
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    # get the real path to the python executable, allows for virtualenv setups
    local py2_interp=`python2 -c "import os,sys; print(os.path.realpath(sys.executable))"`
    local py2_inc="${py2_interp/\/bin\///include/}"
    local py2_lib=`ldd ${py2_interp} | grep python | cut -d " " -f 3 | sed 's/\(.*.so\).*/\1/'`

    #TODO: should this be? cmake .. -DCMAKE_INSTALL_PREFIX=${pkg}/usr \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	     -DPYTHON_EXECUTABLE:PATH=${py2_interp} \
	     -DPYTHON_INCLUDE_DIR:PATH=${py2_inc} \
             -DPYTHON_LIBRARY:FILEPATH=${py2_lib}
    make
}

package() {
    cd ufc/build
    make install DESTDIR="${pkgdir}"
}
