#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libfm-fixes-git
pkgver=20120712
pkgrel=1
url="https://github.com/geekless/libfm"
pkgdesc="the core of next generation file manager PCManFM"
arch=('i686' 'x86_64')
license=('GPL')
depends=('udisks' 'gtk2' 'glib2' 'vala' 'menu-cache')
optdepends=('gvfs: To access remote file systems.'
'ffmpegthumbnailer: video thumbnails'
'pdftoppm: pdf thumbnails'
'convert: epub thumbnails'
'unzip: epub thumbnails')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc' 'automake-1.11')
provides=('libfm' )
conflicts=('libfm' 'libfm-git' 'libfm_with_external_thumbnailers')

_gitroot="git://github.com/geekless/libfm"
_gitname="${pkgname%-git}"

build() {

    msg "Connecting to GIT server...."
    cd "${srcdir}"
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    [ -d "$srcdir/${_gitname}-build" ] && rm -rf "$srcdir/${_gitname}-build"
    git clone "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"

    msg "GIT checkout done or server timeout"

    msg "Start to build..."
    cd "$srcdir/${_gitname}-build"
    sh ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --enable-udisks --with-gnu-ld || return 1

    # strange: twice make is needed only for makepkg; compiling manually is fine
    make || make
}
package ()
{
    cd "$srcdir/${_gitname}-build"
    make DESTDIR="$pkgdir/" install
    #mv $pkgdir/usr/bin/{libfm-demo,libfm}
    #install -Dm644 $srcdir/${_gitname}.png $pkgdir/usr/share/pixmaps/${_gitname}.png
    #install -Dm755 $srcdir/${_gitname}.desktop $pkgdir/usr/share/applications/${_gitname}.desktop
}


