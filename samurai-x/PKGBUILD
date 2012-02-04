# Maintainer: TDY <tdy@gmx.com>

pkgname=samurai-x
pkgver=0.2
pkgrel=1
pkgdesc="A window manager for X written in pure Python"
arch=('i686' 'x86_64')
url="http://samurai-x.org/"
license=('BSD')
depends=('ooxcb' 'setuptools' 'sx-desktops' 'sx-moveresize' 'yahiko')
optdepends=('sx-autoclient:    client creation rules plugin'
            'sx-background:    background changer plugin'
            'sx-bind:          keybinding plugin'
            'sx-cairodeco:     alternative window decorator plugin'
            'sx-clientbuttons: client button binding plugin'
            'sx-dbus:          DBus module'
            'sx-focus:         mouse focus plugin'
            'sx-gobject:       GObject-based main loop plugin'
            'sx-help:          help plugin'
            'sx-layoutmgr:     desktop layout plugin'
            'sx-simpledeco:    cairo-independent window decorator plugin'
            'sx-tiling:        tiling window manager plugin'
            'sx-web:           wsgi web server plugin')
install=sx-wm.install
source=(http://samurai-x.org/downloads/samurai-x2-$pkgver.tar.gz)
md5sums=('60ef2e45cba438b01a6771845b3761a9')

build() {
  cd "$srcdir/samurai-x2-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/samurai-x/LICENSE"
}
