# Maintainer: Mauro Fruet <maurofruet@gmail.com>
# Contributor: oke3 < Sekereg [at] gmx [dot] com >
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>

pkgname=gtk-sharp-beans-git
pkgver=20120418
pkgrel=1
pkgdesc="Gtk Sharp Beans aims to fill the gap between the current Gtk sharp packages state and all the blings and desktop integration stuffs"
arch=('any')
url="http://github.com/mono/gtk-sharp-beans"
license=('LGPL')
depends=('gio-sharp-git')
makedepends=('git')
conflicts=('gtk-sharp-beans')
provides=('gtk-sharp-beans')
options=('!makeflags')

_gitroot="git://github.com/mono/gtk-sharp-beans.git"
_gitname="gtk-sharp-beans"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var

    make
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install
}
