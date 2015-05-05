# Maintainer: skmrx <skmrx@opmbx.org>
# 
# References
# http://jessecfisher.github.io/blog/2013/08/03/installing-elance-tracker-on-arch-linux-x64/
# https://wiki.archlinux.org/index.php/Adobe_AIR

pkgname='elance-tracker'
pkgver='2.3.3'
pkgrel=1
pkgdesc="Time tracking tool for freelancers on Elance"
arch=('i686' 'x86_64')
url="http://help.elance.com/hc/en-us/articles/203735263-What-is-Elance-Tracker-"
license=('custom')
depends=('adobe-air')
makedepends=('rpmextract')
source=('https://www.elance.com/tracker/TrackerSetup.rpm' 'elance-tracker')
noextract=('TrackerSetup.rpm')
md5sums=('356798ce170a942e0fbb3ed5e6243e65' 'aa6077997b281a800f8a0772c1e1136f')

build() {
    mkdir tracker
    cd    tracker
    rpmextract.sh ../TrackerSetup.rpm
}

package() {
    cp    -r "$srcdir/tracker/"* "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    cp       "$srcdir/elance-tracker" "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln    -s "/opt/Tracker/share/license.html" "$pkgdir/usr/share/licenses/$pkgname/"
}

