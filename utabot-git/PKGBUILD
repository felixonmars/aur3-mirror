# Maintainer: Mike Wolf <m AT mw DOT gg>

_pkgname=utabot
pkgname=${_pkgname}-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Tiny Python 3 IRC bot to show METAR & TAF reports, VATSIM network info. Can be extended for other tasks.."
arch=('any')
url="https://github.com/mwgg/utabot"
license=('GPLv3')
depends=('python')
makedepends=('git')
provides=('utabot')
source="git+https://github.com/mwgg/utabot.git"
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    cp utabot.py "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/utabot.py"
}
