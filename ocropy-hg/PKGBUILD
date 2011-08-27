# Maintainer: Ilya Mezhirov <mezhirov at iupr dot com>
# Contributor: MTsoul

pkgname=ocropy-hg
pkgver=111
pkgrel=1
pkgdesc="Python part of OCRopus: top-level scripts"
arch=('any')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
makedepends=('mercurial' 'python2')
depends=('ocroswig-hg' 'python-scipy' 'python-matplotlib')
conflicts=('ocropy')
source=()
md5sums=()


_hgroot="https://ocropy.ocropus.googlecode.com/hg/"
_hgrepo="ocropy"

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        msg "The local files are updated."
    else
        hg clone $_hgroot $_hgrepo || return 1
    fi

    msg "Mercurial checkout done or server timeout"

    rm -rf "$srcdir/$pkgname-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$pkgname-build"
    cd "$srcdir/$pkgname-build"

    msg "fixing sources with sed..."
    find -name 'ocropus-*' -or -name '*.py' |
        while read filename
        do
        {
            sed -i 's|/usr/local/share/|/usr/share/|g; s|/usr/bin/env python$|/usr/bin/env python2|; s|/usr/bin/python$|/usr/bin/python2|' $filename
        }
        done

    msg "running setup.py"
    python2 setup.py install --root=$pkgdir
}

