# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	Ionut Biru	<archlinux.org: ibiru>

pkgname=lib32-libcl
pkgver=1.1
_pkgver=304.37
pkgrel=1
pkgdesc="OpenCL library and ICD loader from NVIDIA"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('lib32-gcc-libs')
license=('custom')
options=('!strip')
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${_pkgver}/NVIDIA-Linux-x86-${_pkgver}.run")
md5sums=('ee3e97109201ab954c96860e28ada611')

build() {
    cd "${srcdir}"
    sh NVIDIA-Linux-x86-${_pkgver}.run --extract-only
}

package() {
    cd "${srcdir}/NVIDIA-Linux-x86-${_pkgver}"
    install -D -m755 libOpenCL.so.1.0.0 "${pkgdir}/usr/lib32/libOpenCL.so.1.0.0"
    ln -s /usr/lib32/libOpenCL.so.1.0.0 "${pkgdir}/usr/lib32/libOpenCL.so.1"
    ln -s /usr/lib32/libOpenCL.so.1 "${pkgdir}/usr/lib32/libOpenCL.so"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
