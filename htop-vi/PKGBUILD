# $Id: PKGBUILD 105144 2012-01-21 21:54:48
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor (v1.0 vi-patch): Evan LeCompte <evanlec@gmail.com>
# Contributor (v1.0.3 vi-patch): Wesley Merkel <ooesili at gmail.com>
# Maintainer: Evan LeCompte <evanlec@gmail.com>

_pkgname=htop
pkgname=htop-vi
pkgver=1.0.3
pkgrel=1
pkgdesc="Interactive process viewer patched for vi style scroll keys"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net/"
license=('GPL')
depends=('ncurses')
makedepends=('python2')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("http://hisham.hm/$_pkgname/releases/$pkgver/$_pkgname-$pkgver.tar.gz"
        'htop-1.0.3-vi.patch')
sha512sums=('4c5c784b093bcad06eb2e8d8bb215e14f6e838a3d47d8da8402344c270c1724f85d0bcde2899571ba5d0e5a02274a0c3390a76fed61785b2604b51351f08f232'
            '587a29d96e08f66c3b46fdf0327166500df156233cc9e00b8b8f87e31e04350f075e6565014991ade8342e31ec6cc15d49bc4650d1ec6822e2c54cb62e6a76dc')

prepare() {
    cd ${srcdir}/$_pkgname-${pkgver}
    sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure 
    sed -i 's|python|python2|' scripts/MakeHeader.py
    # Vi keybindings patch: https://gist.github.com/ooesili/11292865
    patch -N -i ../htop-1.0.3-vi.patch
}

build() {
    cd ${srcdir}/$_pkgname-${pkgver}
    ./configure \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup
    make
}

package() {
    cd ${srcdir}/$_pkgname-${pkgver}
    make DESTDIR=${pkgdir} install 
}
