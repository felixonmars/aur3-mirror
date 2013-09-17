# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>

pkgname=placet-svn
pkgver=2641
pkgrel=1
pkgdesc="Accelerator Optics simulation code, svn development version"
url="http://project-placet.web.cern.ch/project-placet/"
license=("gpl2")
depends=('gcc-libs' 'tcl' 'octave' 'python' 'openmpi')
#conflicts=("htgen")
provides=("placet")
makedepends=('subversion')
arch=('x86_64')

source=('svn+http://svnweb.cern.ch/guest/clicsw/trunk/placet')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/placet" &&  svnversion
}
build() {
    cd placet
#    export LDFLAGS="-Wl,--hash-style=gnu" # -Wl,--as-needed"

#    cmake \
#        -DOCTAVE_PREFIX=/opt \
#        -DCMAKE_INSTALL_PREFIX=/usr \
#        -DINSTALL_HTGEN=ON \
#        -DBUILD_SHARED_LIBS=ON \
#    ${srcdir}/$_svnmod
    ./configure \
        --enable-octave \
        --enable-python \
        --enable-mpi \
        --with-python=python2 \
        --prefix=/usr

    make
}

check() {
    cd placet
    make test
}

package() {
    cd placet
    make DESTDIR=${pkgdir} install

    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

    # Prefer the binary to have different name:
    cd ${pkgdir}/usr/bin/
    mv placet placet-r${pkgver}
    ln -s placet-r${pkgver} placet
}
