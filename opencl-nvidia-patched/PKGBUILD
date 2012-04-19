# $Id$
# Maintainer of original package: Thomas Baechler <thomas@archlinux.org>
# Contributor of original package: James Rayner <iphitus@gmail.com>
# Contributor to patched package: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
# Security Vulnerability patch for: CVE-2012-0946
pkgname=opencl-nvidia-patched
pkgver=295.33
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
	    ftp://download.nvidia.com/XFree86/patches/security/CVE-2012-0946/nvidia-blacklist-register-mapping-290-295.diff)
    md5sums=('1634fb3115526caeae5eb8227282bf17'
	    'aff18975d955e0a6f929a3b72d2c2202')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
	    ftp://download.nvidia.com/XFree86/patches/security/CVE-2012-0946/nvidia-blacklist-register-mapping-290-295.diff)
    md5sums=('04e814843bcaf23efa0b4b3df4ea2700'
	    'aff18975d955e0a6f929a3b72d2c2202')
fi

create_links() {
    # create soname links
    while read -d '' _lib; do
        _soname="$(dirname "${_lib}")/$(readelf -d "${_lib}" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
        [[ -e "${_soname}" ]] || ln -s "$(basename "${_lib}")" "${_soname}"
        [[ -e "${_soname/.[0-9]*/}" ]] || ln -s "$(basename "${_soname}")" "${_soname/.[0-9]*/}"
    done < <(find "${pkgdir}" -type f -name '*.so*' -print0)
}

build() {
    cd "${srcdir}"
    sh "${_pkg}.run" --apply-patch nvidia-blacklist-register-mapping-290-295.diff
    sh "${_pkg}-custom.run" --extract-only
}

package() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('libcl')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=('opencl-nvidia')
    cd "${srcdir}/${_pkg}-custom"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
    create_links
}
