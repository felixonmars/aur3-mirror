# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=blackfin-toolchain-elf
pkgver=2009R1
pkgrel=1
pkgdesc="GNU Toolchain for the Blackfin Processor"
arch=('i686')
url="https://blackfin.uclinux.org/"
license=('GPL2')
depends=()
options=(!libtool !emptydirs zipman docs)
makedepends=('git' 'bison' 'autoconf' 'automake' 'awk' 'libftdi' 'expect' 'dejagnu')
source=(https://blackfin.uclinux.org/gf/download/frsrelease/344/3179/${pkgname}-SVN.i386.tar.bz2)
md5sums=('86df6f8942b7f6fb7380164b2bd9eaad')

build() {
    install -d ${pkgdir}/usr/blackfin/{bin,include,info,lib,libexec,man,share} ${pkgdir}/usr/blackfin/bfin-elf/{bin,include,lib}
    install -Dm755 ${srcdir}/bfin-elf/bin/* ${pkgdir}/usr/blackfin/bin/ || return 1
    install -Dm755 ${srcdir}/bfin-elf/info/* ${pkgdir}/usr/blackfin/info/ || return 1
    cp -aRf ${srcdir}/bfin-elf/lib/* ${pkgdir}/usr/blackfin/lib/ || return 1
    cp -aRf ${srcdir}/bfin-elf/libexec/* ${pkgdir}/usr/blackfin/libexec/ || return 1
    cp -aRf ${srcdir}/bfin-elf/man/* ${pkgdir}/usr/blackfin/man/ || return 1
    cp -aRf ${srcdir}/bfin-elf/share/* ${pkgdir}/usr/blackfin/share/ || return 1
    install -Dm755 ${srcdir}/bfin-elf/bfin-elf/bin/* ${pkgdir}/usr/blackfin/bfin-elf/bin/ || return 1
    cp -aRf ${srcdir}/bfin-elf/bfin-elf/include/* ${pkgdir}/usr/blackfin/bfin-elf/include/ || return 1
    cp -aRf ${srcdir}/bfin-elf/bfin-elf/lib/* ${pkgdir}/usr/blackfin/bfin-elf/lib/ || return 1
}
