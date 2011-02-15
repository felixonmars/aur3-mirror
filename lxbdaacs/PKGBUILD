# Contributor: wido <widomaker2k7@gmail.com>

pkgname=lxbdaacs
pkgver=0.2.1
pkgrel=2
pkgdesc="plugin AACS for lxbdplayer."
arch=('any')
depends=("lxbdplayer<=${pkgver}" 'makemkv')
provides=()
license=(GPL3)
url="http://doc.ubuntu-fr.org/lxbdplayer"
#source=(http://www.mediafire.com/?ytizaytjv5z)
source=(${pkgname}_${pkgver}_all.deb)
md5sums=('cb1fcf81eda3ce03e968dc333e0179eb')

package() {
    cd ${srcdir}
    ar p ${pkgname}_${pkgver}_all.deb data.tar.gz | tar zx
    # dbkey
    install -Dm755 $srcdir/usr/bin/bdkey-install $pkgdir/usr/bin/bdkey-install
    # Licence
    install -Dm644 $srcdir/usr/share/doc/lxbdplayer/plugins/copyright $pkgdir/usr/share/doc/lxbdplayer/plugins/copyright
    # Plugins
    install -Dm755 $srcdir/usr/share/lxbdplayer/plugins/lxBDAACS.jar $pkgdir/usr/share/lxbdplayer/plugins/lxBDAACS.jar
}
