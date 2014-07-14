# Maintainter: Trevor Mosey <uberushaximus AT gmail DOT com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=zlib-cloudflare-git
pkgver=v1.2.8
pkgrel=1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (CloudFlare fork)'
arch=('i686' 'x86_64' 'arm' 'armv6h')
license=('custom')
url="https://github.com/cloudflare/zlib"
depends=('glibc')
options=('staticlibs')  # needed by binutils testsuite
source=("git+https://github.com/cloudflare/zlib.git")
md5sums=('SKIP')
_gitname=zlib
provides=(zlib)
conflicts=(zlib)

pkgver() {
      cd $_gitname
        git describe --always | sed 's|-|.|g'
}

prepare() {
    cd $_gitname
    grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build() {
    cd $_gitname
    ./configure --prefix=/usr
    make
}

check() {
    cd $_gitname
    make test
}

package() {
    cd $_gitname
    make install DESTDIR=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/zlib/LICENSE
}
