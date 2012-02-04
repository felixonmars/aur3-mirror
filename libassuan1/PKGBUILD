# Contributor: Tom < reztho at archlinux dot us >
# Based on the original libassuan 1.0.5 PKGBUILD from Archlinux

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=libassuan1
pkgver=1.0.5
pkgrel=2
pkgdesc="Libassuan is the IPC library used by some GnuPG related software"
arch=(i686 x86_64)
license=('GPL')
url="ftp://ftp.gnupg.org/gcrypt/libgcrypt"
depends=('bash')
makedepends=('pth')
source=(ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${pkgver}.tar.bz2)

build() {
     export CFLAGS="${CFLAGS} -fPIC"
     cd ${srcdir}/libassuan-${pkgver}
     ./configure --prefix=/usr/share/libassuan1
     make || return 1
     make DESTDIR=${pkgdir} install
}

md5sums=('c2db0974fcce4401f48f3fa41c4edc5a')

