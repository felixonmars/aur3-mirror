# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
pkgbase=opencl-nvidia-275xx
pkgname='opencl-nvidia-275xx'
pkgver=275.43
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom')
install=nvidia.install
options=('!strip')

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=('aba5889666208d6b69aa6b27ff608842')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=('5a80b13f0e92e33367d49866f6377dc1')
fi

create_links() {
    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*'); do
            _soname="$(dirname ${_lib})/$(readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
            if [ ! -e "${_soname}" ]; then
                    ln -s "$(basename ${_lib})" "${_soname}"
                    ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
            fi
    done
}

build() {
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
}

package_opencl-nvidia-275xx() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('libcl')
    conflicts=('opencl-nvidia')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    cd "${srcdir}/${_pkg}"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 libnvidia-compiler.so.${pkgver} "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    # CUDA
    install -D -m755 libcuda.so.${pkgver} "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 libnvcuvid.so.${pkgver} "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
    create_links
}

