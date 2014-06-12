# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=curator
pkgver=3.0
pkgrel=1
pkgdesc="A static image gallery generator"
arch=('any')
url="http://furius.ca/curator/"
license=('GPL')
depends=('python2-pillow')
makedepends=('mercurial')
source=()
md5sums=()
_hgroot=https://hg.furius.ca/public
_hgrepo=curator
_hgtag=v$pkgver

# no longer does tarballs, uses hg tags
# hg stinks with self-signed certs
# so we must do this old-school
# manual download, manual pkgver

prepare() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."
    if [[ -d "$_hgrepo" ]]; then
        cd "$_hgrepo"
        hg pull -u --insecure
        hg checkout $_hgtag
        msg "The local files are updated."
    else
        hg clone --insecure "$_hgroot/$_hgrepo" "$_hgrepo"
        cd "$_hgrepo"
        hg checkout $_hgtag
    fi
    msg "Mercurial checkout done or server timeout."
}

build() {
    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    sed -i 's/python$/&2/' bin/curator {bin,hs}/curator-hs
    python2 setup.py build
}

package() {
    cd "$srcdir/$_hgrepo-build"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -d "$pkgdir/usr/share/curator/hs"
    cp -r hs/* "$pkgdir/usr/share/curator/hs"
}

