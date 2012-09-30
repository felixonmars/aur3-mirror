# Contributor: Benjamin Wild <benwild@gmx.de>

pkgname=btcat
pkgver=1
pkgrel=2
pkgdesc="download a torrent file from the network and output its contents to the standard output."
arch=(any)
url="http://jordic.com/btcat/"
license=('unknown')
depends=('python2' 'libtorrent-rasterbar')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://jordic.com/btcat/btcat" python2.patch)

build() {
    cd "${srcdir}"
    # patch does not work with symlinks
    rm btcat
    cp ../btcat .
    patch -p0 btcat python2.patch

    install -D -m755 $srcdir/btcat $pkgdir/usr/bin/btcat
}

md5sums=('3f741408a13744ee3165bd18d69b9dea'
         '967a191ca673aec93546640002c794ab')

