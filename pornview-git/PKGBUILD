# Maintainer: Jc García @JyoGa  <jyo.garcia@gmail.com> 
pkgname=pornview-git
pkgver=20121125
pkgrel=2
pkgdesc="A lightweight image viewer."
url="https://github.com/gentoo/pornview"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gdk-pixbuf')
conflicts=('pornview')
provides=('pornview')

_gitroot="git://github.com/gentoo/pornview.git"
_gitname="pornview"


build() {
    mkdir "$srcdir/$pkgname"
    cd "$srcdir/$pkgname"
    msg "Connecting to GIT server ..."

    if [ -d $_gitname ] ; then
        cd $_gitname
        git fetch origin
        git merge origin/trunk
        msg "The local files are updated"
    else

        git clone $_gitroot $_gitname
    fi
    cd "$_gitname"
    msg "GIT checkout done or server timout"
    msg "Configuring..."
    ./autogen.sh
    ./configure --prefix=/usr --with-gtk2
    msg "Starting make...."
    make
}

package() {
    cd "$srcdir/$pkgname/$_gitname"
    make DESTDIR="$pkgdir" install
    cd $pkgdir
    mkdir -p usr/share/applications
    mkdir usr/share/pixmaps
    mv usr/share/gnome/apps/Graphics/pornview.desktop usr/share/applications/
    mv usr/share/icons/hicolor/48x48/pornview.png usr/share/pixmaps/
    rm -R usr/share/gnome/
    rm -R usr/share/icons/
}
