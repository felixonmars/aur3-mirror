# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=xattr
pkgname=python2-$_pkgname-git
pkgver=20111028
pkgrel=1
pkgdesc="module for manipulating filesystem extended attributes"
arch=(i686 x86_64)
url=http://undefined.org/python/#xattr
license=(MIT)
depends=(python2)
makedepends=(git python2-distribute)
provides=(python2-$_pkgname=0.6.4)
conflicts=(python2-$_pkgname)

_gitroot=https://github.com/$_pkgname/$_pkgname.git
_gitname=$_pkgname

package() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [[ -d $_gitname/.git ]]; then
        pushd $_gitname && git pull
        msg2 "The local files are updated."
        popd
    else
        git clone --depth 1 -b v0.6.4 $_gitroot
    fi
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/

    msg "Building..."
    python2 setup.py install --prefix=/usr --root=$pkgdir
    sed -ri 's:^#!/usr/bin/(env )?python$:&2:' "$pkgdir"/usr/lib/python2.7/site-packages/xattr/tool.py
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
