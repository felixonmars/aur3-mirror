# Maintainer: Suhaimi Ghazali <serdotlinecho@gmail.com>

pkgname=mconnect-git
pkgver=r127.15b0907
pkgrel=1
pkgdesc="KDE Connect protocol implementation in Vala/C"
arch=('i686' 'x86_64')
url="https://github.com/bboozzoo/mconnect"
license=('GPL')
depends=('glib2' 'gobject-introspection' 'json-glib' 'libgee' 'libnotify' 'openssl' 'vala')
makedepends=('git')
source=("${pkgname}::git+https://github.com/bboozzoo/mconnect.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
