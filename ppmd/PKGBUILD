# Maintainer: Zhang Li <richselian at gmail.com>
pkgname=ppmd
pkgver=10.1
pkgrel=1
pkgdesc="Fast archiver program with good compression ratio."
arch=(i686 x86_64)
url="http://packages.debian.org/sid/ppmd"
license=('Public domain')
depends=()
makedepends=()
source=(
    "http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
    "http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}-5.debian.tar.gz"
)
md5sums=("27b8bc2d8db273bd32d9ed5dfa0269fb"
         "5633a5116a63d31dc9aeafb7eb1fd0f0")

build() {
    cd "${srcdir}/ppmd-10.1"
    patch -f -p1 < "${srcdir}/debian/patches/00_makefile.patch"
    patch -f -p1 < "${srcdir}/debian/patches/01_upstream.patch"
    patch -f -p1 < "${srcdir}/debian/patches/02_non-intel.patch"
    patch -f -p1 < "${srcdir}/debian/patches/03_hardlink.patch"
    patch -f -p1 < "${srcdir}/debian/patches/04_warnings.patch"
    patch -f -p1 < "${srcdir}/debian/patches/05_no_copy_dirent.patch"
    test "${arch}" = "i686"   && make "CPPFLAGS+=-D_32_NORMAL"
    test "${arch}" = "x86_64" && make "CPPFLAGS+=-D_64_NORMAL"

    install -D -m755 "${srcdir}/ppmd-10.1/ppmd" "${pkgdir}/usr/bin/ppmd"
    install -D -m644 "${srcdir}/debian/ppmd.1"  "${pkgdir}/usr/share/man/man1/ppmd.1"
}
