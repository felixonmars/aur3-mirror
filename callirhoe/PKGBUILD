# Maintainer: Nick Kavalieris <ph4ntome[at]gmail[dot]com>
# Upstream Author : George Tzoumas <geotz[at]gmail[dot]com>
# For contributors check the AUTHORS file

# This file is also included in the source tree for purposes of completeness
# The normal way of aqusition is from AUR: https://aur.archlinux.org/packages/callirhoe/

pkgname=callirhoe
pkgver=v0.4.1.r3.g305b483
pkgrel=1
pkgdesc="PDF & Photo calendar creator with high quality vector graphics"
url="https://geotz.github.io/callirhoe/"
arch=('any')
license=('GPLv3')
depends=('python2' 'imagemagick' 'python2-cairo' 'subversion')
_gitroot="git://github.com/geotz/callirhoe.git"
_gitname="callirhoe"
md5sums=()


_fetch_git() {
    cd "${srcdir}"
    msg "Connecting to GitHub server..."
    if [ -d $_gitname ]
    then
     cd $_gitname && git pull origin
     msg "The local files are updated."
    else
     git clone -b master --single-branch $_gitroot $_gitname
    fi
    msg "Git checkout done."
}


pkgver() {
    (_fetch_git &> /dev/null )
    cd "${srcdir}"/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    msg "Building package."
    cd "${srcdir}"/$_gitname
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    make DESTDIR="$pkgdir/usr" install
}