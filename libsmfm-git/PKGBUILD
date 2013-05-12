#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsmfm-git
pkgver=20130512
pkgrel=1
url="https://github.com/geekless/libsmfm"
pkgdesc="File managment framework for Stuurman Project. Fork of PCManFM's libfm."
arch=('i686' 'x86_64')
license=('GPL')
#depends=('udisks' 'gtk2' 'glib2' 'vala' 'menu-cache')
depends=('udisks' 'gtk2' 'glib2' 'menu-cache')
optdepends=('gvfs: To access remote file systems.'
'ffmpegthumbnailer: video thumbnails'
'pdftoppm: pdf thumbnails'
'convert: epub thumbnails'
'unzip: epub thumbnails')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc' 'automake')
provides=('libsmfm' )
conflicts=('libsmfm')

source=('git+https://github.com/geekless/libsmfm.git')
md5sums=('SKIP')

_gitname="libsmfm"

pkgver() {
  date +%Y%m%d
}

build() {
    cd "${_gitname}"

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-udisks \
        --disable-actions \
        --enable-silent-rules \
        --enable-demo \
        --with-gnu-ld --|| return 1
    make
}

package () {
    cd "${_gitname}"
    make DESTDIR="$pkgdir/" install
}

