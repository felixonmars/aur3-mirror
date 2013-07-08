# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=btcat2
pkgver=1
pkgrel=2
pkgdesc="Download a torrent file from the network and output its contents to the standard output (python3 fork)."
arch=(any)
url="http://jordic.com/btcat/"
license=('GPL3')
depends=('python' 'python-libtorrent-rasterbar')
provides=('btcat')
conflicts=('btcat')
replaces=('btcat')
source=('http://onny.project-insanity.org/files/btcat')
sha512sums=('cfe9df911da0258ecbec6f14d16e2fe5b23ea59f80db3ba5687d5c3b6678b8b1cd826ba68db63cfb990e490d0ef36c5dbd42c3e53c00cf3a0b8b803755aa6abf')

package() {
    cd "${srcdir}"
    install -D -m755 $srcdir/btcat $pkgdir/usr/bin/btcat
}
