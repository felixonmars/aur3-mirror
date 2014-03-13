# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on extra\deluge's PKGBUILD, adapted for -git version by Berseker

pkgname=deluge-git-master
pkgver=20130527
pkgrel=2
pkgdesc="A bittorrent client written with python and pygtk - Git Version (master branch)"
arch=('any')
url="http://deluge-torrent.org"
license=('GPL3')
conflicts=('deluge' 'deluge-stable-git')
provides=('deluge')
install=deluge.install
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar>=0.16.9'
         'python2-chardet' 'python2-pyopenssl' 'python2-xdg' 'twisted' 'xdg-utils' 'python2-setuptools')
makedepends=('intltool' 'librsvg' 'pygtk>=2.16' 'python2-mako' 'python2-distribute' 'git' )
optdepends=('librsvg: needed for gtk ui'
            'pygtk: needed for gtk ui'
            'python2-mako: needed for web ui'
            'python2-notify: libnotify notifications'
            'geoip: display peer locations')

_branch=master
source=("git://deluge-torrent.org/deluge.git#branch=$_branch"
        'deluged.service' 'deluge-web.service')
md5sums=('SKIP'
         '17f51ac9a90f0dc41a20291444a7489b'
         '2a73f62c04e8b147c731fbb50666e846')

pkgver() {
    cd "$srcdir/deluge"
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    cd "$srcdir/deluge"
    python2 setup.py build
}

package() {
    cd "$srcdir/deluge"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    
    install -d "$pkgdir/srv"
    install -d -m 664 -o 125 -g 125 "$pkgdir/srv/deluge"
    install -Dm644 "deluge/ui/data/pixmaps/deluge.svg" "$pkgdir/usr/share/pixmaps/deluge.svg"
    install -Dm644 "$srcdir/deluged.service"           "$pkgdir/usr/lib/systemd/system/deluged.service"
    install -Dm644 "$srcdir/deluge-web.service"        "$pkgdir/usr/lib/systemd/system/deluge-web.service"
}
