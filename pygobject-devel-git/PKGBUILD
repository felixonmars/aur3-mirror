# Maintainer: Niklas Koep <niklas dot koep at gmail dot com>
pkgname=pygobject-devel-git
pkgver=20130214
pkgrel=1
pkgdesc="Development files for pygobject"
arch=("i686" "x86_64")
url="https://live.gnome.org/PyGObject"
license=("LGPL")
depends=("gobject-introspection" "python2-cairo")
makedepends=("git" "gnome-common-git")
provides=("pygobject-devel")
conflicts=("pygobject-devel")
options=("!libtool")
md5sums=("SKIP")
_gitroot="git://git.gnome.org/pygobject"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ ! -d ${pkgname} ]; then
        git clone ${_gitroot} ${pkgname} --depth=1 || return 1
    fi

    cd ${pkgname}
    git pull origin || return 1

    msg "GIT checkout done"

    msg "Starting make..."
    ./autogen.sh --prefix=/usr --with-python=python2
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${srcdir}/devel" install
    mkdir -p "${pkgdir}/usr/"{include,lib}
    mv "${srcdir}/devel/usr/include" "${pkgdir}/usr"
    mv "${srcdir}/devel/usr/lib/pkgconfig" "${pkgdir}/usr/lib"
}

