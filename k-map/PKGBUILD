pkgname=k-map
pkgver=0.4
pkgrel=1
pkgdesc='Karnaugh map minimizer'
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('GPL2')
depends=('wxgtk' 'webkitgtk2' 'ttf-font') # webkitgtk2 for successful linking

source=("kmap-04-linux.tar.gz::http://prdownloads.sourceforge.net/${pkgname}/kmap-04-linux.tar.gz?download" 'k-map.patch')
sha256sums=(
    'cb2ea8f0f07bc6fcc7b8dc65bdf94c3b3eb0cbfd66a642e5f476d101446843d2'
    '339bc3d23ca4bda40f9fd09bddf97e9d1faff7e113d8d79564536148407ce14e'
)


prepare() {
    cd $srcdir/kmap
    make clean
    patch -p0 -i ../../k-map.patch
}
build() {
    cd $srcdir/kmap
    make
}

package() {
    cd $srcdir/kmap
    install -Dm755 kmm $pkgdir/usr/bin/kmm
    install -Dm644 copying.txt $pkgdir/usr/share/licenses/${pkgname}/copying.txt
    install -Dm644 wxwin.ico $pkgdir/usr/share/pixmaps/${pkgname}/wxwin.ico
    install -Dm644 en/blam.mo $pkgdir/usr/share/locale/en/LC_MESSAGE/blam.mo
    install -Dm644 hr/blam.mo $pkgdir/usr/share/locale/hr/LC_MESSAGE/blam.mo
}

