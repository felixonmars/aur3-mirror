# Contributor: Chris Griffith <codelicious.griffith at gmail dot com>
# Maintainer: Sergey Tereschenko <serg.partizan at gmail dot com>
pkgname=psb-kmod
_origname=psb-kernel-source
pkgver=4.42.0
pkgrel=4
ubuntu=0ubuntu2~1010um5
pkgdesc="Kernel module for Poulsbo(GMA500) graphics chipsets"
arch=('i686')
url="https://launchpad.net/~gma500/"
license=('GPL2')
groups=()
depends=('kernel26>=2.6.30' 'kernel26<=2.6.37' 'psb-firmware>=0.30')
makedepends=('kernel26-headers' 'rpmextract')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=ChangeLog
source=(
    "http://ppa.launchpad.net/gma500/ppa/ubuntu/pool/main/p/psb-kernel-source/${_origname}_${pkgver}-${ubuntu}.tar.gz"
    "2.6.36-ioctl.dpatch"
    )
noextract=()

build() {
    cd ${srcdir}/${_origname}

    #apply patches
    for p in `grep -v "^#" debian/patches/00list`
    do
        [ ${p} == "06_i2c-intelfb.dpatch" ] && continue
        patch -Np1 -i debian/patches/${p} || return 1
    done
    patch -Np1 -i ../2.6.36-ioctl.dpatch

    #compile
    make DRM_MODULES="psb" || return 1
}

package () {
    cd ${srcdir}/${_origname}

    install -dm 755 ${pkgdir}/lib/modules/$(uname -r)/extra/psb
    install -m 755 drm-psb.ko ${pkgdir}/lib/modules/$(uname -r)/extra/psb
    install -m 755 psb.ko ${pkgdir}/lib/modules/$(uname -r)/extra/psb
}

md5sums=('0d1401e8f63abaa6c059b9ebf2c76880'
         '203bd11b2e21ffd9ce2e83bf6998bd92')
