# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Zerial <fernando@zerial.org>

_pkgname=fluxstyle
pkgname=$_pkgname-hg
pkgver=55
pkgrel=1
pkgdesc="A graphical style/theme manager for the fluxbox windows manager."
arch=(any)
url=https://github.com/michaelrice/fluxStyle
license=(GPL2)
depends=(pygtk)
makedepends=(mercurial)
conflicts=($_pkgname-git)
replaces=($_pkgname-git)
source=($_pkgname-gladefix.patch)
sha256sums=('4d872fd3af3d5747b6a33b4304f8aff231ab669a447ecabd31603e6dc0ec8728')
sha512sums=('017abc8af85ccffd28aed3488b87d4a07992c6acfbcfa5146755b51c4528023538fb90ab4c1837e1f89c701f6781ec94ab19b3615117342c7ed9332cfed9788e')

_hgroot=https://fluxstyle.googlecode.com/hg/
_hgrepo=$_pkgname

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
    cd $_hgrepo-build/

    msg "Building..."
    patch -Np0 -i ../$_pkgname-gladefix.patch
    sed -i 's:^#!/usr/bin/env python$:&2:g' fluxStyle
    sed -i -e '51,51 s:images:glade:' -e 's:^#!/usr/bin/env python$:&2:g' setup.py

    ./setup.py install --root="$pkgdir"
}
