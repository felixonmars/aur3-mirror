# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=sxiv
pkgname=${_pkgname}-bskv-git
pkgver=473
pkgrel=1
pkgdesc='Simple X image viewer, personal XFT capable branch'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/muennich/${_pkgname}"
depends=('imlib2' 'giflib' 'libxft')
makedepends=('git')
optdepends=('imagemagick: for the example commands in config.def.h'
            'libjpeg-turbo: for the example commands in config.def.h'
            'gimp: for the example commands in config.def.h')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git#branch=personal")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    if [ -e "$startdir"/config.h ] ; then
        msg "Using custom 'config.h'."
        cp "$startdir"/config.h .
    fi
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 sxiv.desktop "${pkgdir}/usr/share/applications/sxiv.desktop"
}
