# Contributor: Lyman Li <lymanrb@gmail.com>

_pkgname=scim-sunpinyin
pkgname=$_pkgname-hg
pkgver=714
pkgrel=1
pkgdesc="A SLM (Statistical Language Model) based pinyin IME"
arch=(i686 x86_64)
url=http://www.opensolaris.org/os/project/input-method/
license=(CDDL LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(scim)
makedepends=(mercurial openssh)
options=(!libtool)

_hgroot=ssh://anon@hg.opensolaris.org/hg/nv-g11n/
_hgrepo=inputmethod

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."
    if [[ -d $_hgrepo/.hg ]]; then
        pushd $_hgrepo/ && hg pull -u
        msg2 "The local files are updated."
        popd
    else
        hg clone $_hgroot $_hgrepo
    fi
    msg2 "Mercurial checkout done or server timeout"

    rm -rf $_hgrepo-build/
    cp -r $_hgrepo/ $_hgrepo-build/
    cd $_hgrepo-build/sunpinyin/ime/

    msg "Building..."
    ./autogen.sh --prefix=/usr \
        --enable-scim \
        --disable-cle \
        --disable-debug
    make
}

package() {
    cd "$srcdir"/$_hgrepo-build/sunpinyin/ime/
    make DESTDIR="$pkgdir" install
}
