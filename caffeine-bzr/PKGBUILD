# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: LookTJ/Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: alessandro_ufms

pkgname=caffeine-bzr
pkgver=2.7.2.600.29aed28
pkgrel=2
epoch=1
pkgdesc="A system applet that allows you to inhibit the screensaver and the sleep power saving mode in an easy way"
arch=(any)
url=https://launchpad.net/caffeine
license=(GPL3)
depends=(dconf gtk2 kaa-metadata libappindicator3 python-dbus python-gobject
    python-xdg python3-xlib)
makedepends=(bzr)
options=(!emptydirs !libtool)
install=$pkgname.install
source=($pkgname::bzr+http://bazaar.launchpad.net/~caffeine-developers/${pkgname%-*}/main/)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(grep version setup.py | sed  's/[^0-9.]//g').$(bzr revno).$(bzr testament | awk '/sha1/ { print $2 }' | head -c7)
}

prepare() {
    cd $pkgname/
    #find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
    chmod +x setup.py
}

build() {
    cd $pkgname/
    ./setup.py build
}


package() {
    cd $pkgname/
    ./setup.py install --root="$pkgdir"
}
