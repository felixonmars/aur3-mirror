# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Maintainer: Mpie <michael.kyne-phillips1@ntlworld.com>
# Maintainer: Delphos.Sensei <Delphos.sensei@gmail.com>
pkgname=openlaszlo
pkgver=4.7.2
pkgrel=1
pkgdesc="OpenLaszlo is an open-source web development platform"
url="http://openlaszlo.org"
arch=('i686')
license=""
depends=('j2sdk')
install=
source=(http://download.openlaszlo.org/$pkgver/$pkgname-$pkgver-unix.tar.gz)
md5sums=('be296c54aabdcf3c3e8a931ce27caf43')

build() {
    echo '==> Creating directories...'
    mkdir -p $startdir/pkg/opt
    mkdir -p $startdir/pkg/etc/rc.d
    
    echo '==> Copying files...'
    cd $startdir/src
    cp -a lps-$pkgver $startdir/pkg/opt/
    
}
