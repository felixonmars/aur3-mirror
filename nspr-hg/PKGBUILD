# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Structure from extra/nspr package)
# Stable Package Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=nspr-hg
pkgver=4.10.3.4496.4a6c30714ec1
pkgrel=1
pkgdesc="Netscape Portable Runtime (mercurial development version)"
arch=(i686 x86_64)
url=https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR
license=(MPL GPL)
depends=(glibc)
makedepends=(mercurial)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!emptydirs)
source=($pkgname::hg+https://hg.mozilla.org/projects/${pkgname%-*})
md5sums=('SKIP')

pkgver() {
    cd $pkgname/
    _major=$(grep 'MOD_MAJOR_VERSION=' configure.in | tr -d 'A-Z_=')
    _minor=$(grep 'MOD_MINOR_VERSION=' configure.in | tr -d 'A-Z_=')
    _patch=$(grep 'MOD_PATCH_VERSION=' configure.in | tr -d 'A-Z_=')

    echo $_major.$_minor.$_patch.$(hg identify -n).$(hg identify -i)
}

build() {
    cd $pkgname/

    if [ "$CARCH" = "x86_64" ]; then
        _confflags="--enable-64bit"
    else
        _confflags=""
    fi

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --includedir=/usr/include/nspr \
        --enable-optimize \
        --disable-debug ${_confflags}
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install

    ln -s nspr.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nspr.pc"
    rm -r "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties} \
        "$pkgdir/usr/include/nspr/md"
}
