# Maintainer: Daniel YC Lin <dlin.tw at gmail>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

_target=sh
pkgname=${_target}-linux-api-headers
pkgver=3.5.5
_basever=3.5
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz")


build() {
  cd ${srcdir}/linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -p1 -i ${srcdir}/patch-${pkgver}

  make ARCH=sh mrproper
  make ARCH=sh headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}

  make INSTALL_HDR_PATH=${pkgdir}/usr/${_target}/ ARCH=sh V=0  headers_install

  # use headers from libdrm
  #rm -rf ${pkgdir}/usr/include/drm
  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete

  #
  #mkdir -p ${pkgdir}/usr/${_target}/usr
  #(
  # cd ${pkgdir}/usr/${_target}/usr
  # ln -s ../{include,lib} .
  #)
}

md5sums=('24153eaaa81dedc9481ada8cd9c3b83d'
         '0d658ffcd548ab029c9a8d6c4d07e8e2')
