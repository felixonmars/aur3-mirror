# Maintainer: frankspace/Frank Carlyle McLaughlin <my-first-name@my-user-name.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: LookTJ/Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: alessandro_ufms

pkgname=caffeine-bzr-2.5
_pkgname=caffeine-bzr
pkgver=2.5.513
pkgrel=1
pkgdesc="Status bar applet to manually disable the screensaver, the last version of Caffeine with that ability"
arch=(any)
url=https://launchpad.net/caffeine
license=(GPL3)
depends=(dconf gtk2 hicolor-icon-theme kaa-metadata libappindicator3 python2-dbus python2-gobject python2-notify python2-xdg python2-xlib)
makedepends=(bzr)
options=(!emptydirs !libtool)
install=$_pkgname.install
source=($_pkgname::bzr+http://bazaar.launchpad.net/~caffeine-developers/${_pkgname%-*}/main/)
sha256sums=('SKIP')

pkgver() {

# I tried some of the later commits and they didn't work for me
    _commit=513
    
    cd $_pkgname/
    bzr revert -r$_commit
    echo $(cat VERSION).$_commit.$(bzr testament -r$_commit | awk '/sha1/ { print $2 }' | head -c7)
}

prepare() {
    cd $_pkgname/
    find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
    chmod +x setup.py

# this is ugly but it works and avoids needing a patch file
    sed -i '/\#\# local modules/ i\
import signal' caffeine/main.py
    sed -i '/GObject\.threads\_init\(\)/ i\
    signal.signal(signal.SIGINT, signal.SIG_DFL)' caffeine/main.py
}

build() {
    cd $_pkgname/
    ./setup.py build
}

package() {
    cd $_pkgname/
    ./setup.py install --root="$pkgdir"
}
