# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

_pkgname=clfft-intel
pkgname=${_pkgname}-git
pkgver=20140619
pkgrel=2
pkgdesc="A software library containing FFT functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=("intel-opencl-sdk")
provides=('clfft-intel' 'clfft')
conflicts=('clfft-intel' 'clfft')

source=("${_pkgname}"::"git+https://github.com/clMathLibraries/clFFT")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    export DESTDIR="${pkgdir}"
    cd "${srcdir}/${_pkgname}/src"
    cmake -DOPENCL_ROOT=/opt/intel/opencl-sdk -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ./
    make clFFT
}

package() {
    cd "${srcdir}/${_pkgname}/src"
    make install
    mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}
