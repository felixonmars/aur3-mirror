# Contributor: flow

pkgname=openarena-cmp
_pkgbasename=openarena
pkgver=1
pkgrel=1
pkgdesc="OpenArena Community Mappack Volume 1 v3"
arch=('any')
url="http://www.moddb.com/members/neon-knight/addons/openarena-community-mappack-volume-1-v3-re-release"
license=('GPLv2')
depends=('openarena')
source=(http://www.moddb.com/downloads/mirror/64571/101/4eecc6965b29ea2320d220a82ec5d38a)
md5sums=('3693ca8fb386e077b6264490a5b24407')


build() {
    cd $srcdir/
}

package() {
    install -d $pkgdir/opt/$_pkgbasename/
    cp -rf $srcdir/{baseoa,docs,oacmp-mod,sources}/ $pkgdir/opt/$_pkgbasename/

    find $pkgdir/opt/$_pkgbasename -type f -exec chmod 644 {} +
}

