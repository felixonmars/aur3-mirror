pkgname="botan-unstable"
pkgdesc="The kitchen sink of crypto for C++"
url="http://botan.randombit.net/"
# Maintainer: nly <andrew at nelless dot net>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: Alexander RÃ¸dseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>

pkgver=1.11.10
pkgrel=2
arch=('i686' 'x86_64')
license=('custom:BSD')
options=('staticlibs' '!buildflags')

source=(
    "http://files.randombit.net/botan/Botan-$pkgver.tgz"{,.asc}
)
sha256sums=('cb8794d1c5692ec851dbd599fc90d87d5474b8e86518e6f0157994a417b8a519' 'SKIP')

makedepends=(
    "python2>=2.7"
    "gnupg>=2.0"
    "boost>=1.57.0"
    "python-sphinx>=1.2.3"
)

depends=(
    "zlib>=1.2"
    "sqlite>=3.8"
    "boost-libs>=1.57"
    "xz>=5.0"
)

build() {
    cd "Botan-$pkgver"
    # install.py seems to be broken under Python 3
    find -type f -iname '*.py' -exec sed -i 's~#!/usr/bin/python~#!/usr/bin/python2~' {} \;
    python2 ./configure.py \
        --prefix=/usr \
        --destdir=$pkgdir/usr \
        --os=linux \
        --cc=gcc \
        --cpu=$CARCH \
        --with-zlib \
        --with-lzma \
        --with-sphinx \
        --with-sqlite3 \
        --disable-ssse3 \
        --disable-avx2 \
        --disable-aes-ni
    make
}

package() {
    cd "Botan-$pkgver"

    make install
    install -Dm644 "$pkgdir/usr/share/doc/botan/license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
