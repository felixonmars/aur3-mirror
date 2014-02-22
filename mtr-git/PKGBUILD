# Maintainer: Dolpa <antkov@gmail.com>
pkgbase=mtr-git
pkgname=mtr-git
pkgver=20140221_v0.85_39_gb46c559
pkgrel=1
pkgdesc="Combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool (w/o IPv6 bugfix)"
arch=('i686' 'x86_64')
url="https://github.com/traviscross/mtr"
license=('GPL')
makedepends=('ncurses')
conflicts=('mtr')
source=("git://github.com/traviscross/mtr")
md5sums=('SKIP')

_gitname="mtr"

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}

build() {
    cd "${srcdir}/${_gitname}"
    ./bootstrap.sh
    ./configure --prefix=/usr --without-gtk --sbindir=/usr/bin
    make
}

package () {
    depends=('ncurses' 'glib2')
    cd "${srcdir}/${_gitname}"
    make DESTDIR=${pkgdir} install
}
