# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=curator-hg
pkgver=68
pkgrel=1
pkgdesc="A static image gallery generator"
arch=('any')
url="http://furius.ca/curator/"
license=('GPL')
depends=('python2-pillow')
makedepends=('mercurial')
conflicts=('curator')
provides=('curator')
source=()
md5sums=()
_hgroot=https://hg.furius.ca/public
_hgrepo=curator

# hg stinks with self-signed certs
# so we must do this old-school
# manual download, manual pkgver

prepare() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."
    if [[ -d "$_hgrepo" ]]; then
        cd "$_hgrepo"
        hg pull -u --insecure
        msg "The local files are updated."
        cd ..
    else
        hg clone --insecure "$_hgroot/$_hgrepo" "$_hgrepo"
    fi
    msg "Mercurial checkout done or server timeout."

    cd "$_hgrepo"
    pkgver=$(hg identify -n)
}

build() {
    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    # python3 for fun
    #2to3 --write --no-diffs bin/curator {bin,hs}/curator-hs setup.py
    #sed -i 's/\t/        /g' bin/curator
    #sed -i 's/dircache/os/g' bin/curator
    #sed -i 's/( cmp_img )/( key=lambda a: a._base )/' bin/curator 
    # -hs works fine but 'curator' is not that much fun

    sed -i 's/python$/&2/' bin/curator {bin,hs}/curator-hs

    python2 setup.py build
}

package() {
    cd "$srcdir/$_hgrepo-build"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -d "$pkgdir/usr/share/curator/hs"
    cp -r hs/* "$pkgdir/usr/share/curator/hs"
}

