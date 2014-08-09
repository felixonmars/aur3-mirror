# Maintainer: Joshua Ellis <coujellis@gmail.com>

pkgname=clhep-git
pkgver=2.2.0.1.r2.g012adb7
pkgrel=1
pkgdesc="A Class library for High Energy Physics"
url="http://proj-clhep.web.cern.ch/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gcc-libs')
makedepends=('git'           # To get the package
             'cmake'         # for building the package
             'texlive-core') # for the documentation
options=('!emptydirs')
conflicts=('clhep')
provides=('clhep')
source=("$pkgname::git+http://git.cern.ch/pub/CLHEP.git#branch=CLHEP_2_200_branch")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g;s/CLHEP\.//'
}

build() {
    msg 'Creating building directory'
    [ -d ${srcdir}/build ] && rm -rf ${srcdir}/build
    mkdir ${srcdir}/build
    cd ${srcdir}/build

    msg 'Compiling the package'
    cmake -DCLHEP_BUILD_DOCS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          ${srcdir}/${pkgname}
    make
}

package() {
      msg 'Creating the package'
      cd ${srcdir}/build
      make DESTDIR="${pkgdir}" install
      install -Dm644 ${srcdir}/${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

      msg 'Moving documentation to standard location'
      [ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
      mv ${pkgdir}/usr/doc/* ${pkgdir}/usr/share/doc/${pkgname}/
}
