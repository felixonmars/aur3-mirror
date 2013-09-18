# Maintainer: Wolfgang Mueller <vehk@kindofautomatic.de>

pkgname=pmpds-git
_realname=pmpds
pkgver=0.6.5
pkgrel=2
pkgdesc="A last.fm audioscrobbler for MPD in perl"
arch=('any')
url="https://github.com/vehk/pmpds"
license=('GPL3')
depends=('mpd' 'perl-www-curl' 'perl-uri')
makedepends=('git')
provides=($_realname)
conflicts=($_realname)
backup=('etc/pmpds/pmpds.conf')

source=('git://github.com/vehk/pmpds.git')
md5sums=('SKIP')
_gitname="pmpds"

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
