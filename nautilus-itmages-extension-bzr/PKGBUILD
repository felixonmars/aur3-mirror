# Contributor: Voldemar Khramtsov <harestomper@gmail.com>

pkgname=nautilus-itmages-extension-bzr
origname="itmages-nautilus-extension-dev"
pkgver=1.23
pkgrel=1
pkgdesc="Nautilus extension for uploading pictures to ITmages.ru"
arch=('i686' 'x86_64')
url="http://bazaar.launchpad.net/~itmages/itmages/itmages-nautilus-extension-dev"
license=('GPL')
groups=('graphics')
depends=('nautilus' 'itmages-service')
makedepends=("cmake" "make" "vala>=0.12" "nautilus" "pkg-config")


build() {
    cd ${srcdir}
    bzr branch lp:~itmages/itmages/${origname} || return 1
    
    cd "${srcdir}/${origname}"
    cmake CMakeLists.txt || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
    mkdir -p ${pkgdir}/usr/lib/nautilus/extensions-3.0/
    ln -s ../extensions-2.0/libnautilus-itmages.so  ${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-itmages.so
}

# vim:set ts=2 sw=2 et:

