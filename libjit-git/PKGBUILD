# Maintainer: Niklas Koep <niklas dot koep at gmail dot com>
pkgname=libjit-git
pkgver=20131029
pkgrel=3
pkgdesc="Library for generic Just-in-Time compiler functionality"
arch=("i686" "x86_64")
url="https://www.gnu.org/software/libjit/"
license=("LGPL")
makedepends=("git")
provides=("libjit")
conflicts=("libjit")
options=("!libtool")
md5sums=("SKIP")
_gitroot="git://git.savannah.gnu.org/libjit.git"

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
    ./auto_gen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}

