pkgname=linux-api-headers-git
pkgver=v3.10.rc3.68.gdcdbe33
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=(git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git)
makedepends=('git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/linux"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/linux"

    make mrproper
    make headers_check
}

package() {
    cd "${srcdir}/linux"

    make INSTALL_HDR_PATH="${pkgdir}/usr" headers_install

    rm -r "${pkgdir}/usr/include/drm"

    find "${pkgdir}" \( -name .install -o -name ..install.cmd \) -delete
}
