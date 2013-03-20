# Maintainer: Pierre Carru <pierre.carru@gmail.com>
pkgname=ltrace-git
pkgver=20130320
pkgrel=1
pkgdesc="Tracks runtime library calls in dynamically linked programs"
arch=('i686' 'x86_64')
url="http://ltrace.alioth.debian.org/"
license=('GPL')
depends=('elfutils')
makedepends=('dejagnu' 'git')
conflicts=(ltrace)
provides=('ltrace=0.7.2')
backup=('etc/ltrace.conf')

_gitroot=("git://anonscm.debian.org/collab-maint/ltrace.git")
_gitname="ltrace"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # build

    ./autogen.sh
    ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-silent-rules
    make
}

check() {
    cd "$srcdir/$_gitname-build"
    make -k check
}

package(){
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install
}

