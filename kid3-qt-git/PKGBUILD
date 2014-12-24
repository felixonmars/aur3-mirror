# Maintainer: Andrew Rabert <arabert@nullsum.net>

pkgname=kid3-qt-git
pkgver=20141220
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor (without KDE dependencies)"
arch=('i686' 'x86_64')
url="http://kid3.sourceforge.net/"
license=('GPL')
install=$pkgname.install
makedepends=('automoc4' 'cmake' 'docbook-xml' 'docbook-xsl' 'phonon-qt4' 'chromaprint' 'id3lib' 'taglib' 'libmp4v2' 'kdebase-runtime' 'git')
depends=('chromaprint' 'id3lib' 'taglib' 'libmp4v2' 'qt4' 'phonon-qt4')
conflicts=('kid3-qt')

_gitroot="git://git.code.sf.net/p/kid3/code"
_gitname="kid3-qt"

build() {
    cd "$srcdir"

    msg "Connecting to the GIT server...."
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin && cd "$srcdir"
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$_gitname-build"
    git clone "$_gitname" "$_gitname-build"
    cd "$_gitname-build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_APPS="CLI;Qt"

    make
}

pkgver() {
    cd "$srcdir/$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install
}
