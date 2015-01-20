# Contributor: OramahMaalhur <oramahmaalhur@gmail.com> 
# Maintainer: OramahMaalhur <oramahmaalhur@gmail.com>
pkgname=fuzelinuxclient
pkgver=14.06.27046 #previous was 14.02.14587
pkgrel=1
pkgdesc='Fuze for Linux'
arch=('x86_64')
url='http://www.fuzebox.com/'
license=('unknown')
depends=('libjpeg6' 'qt4' 'libpng12' 'libxtst' 'glu' 'gconf')
source=("http://apt.fuzebox.com/apt/pool/trusty/rc/f/fuzelinuxclient/fuzelinuxclient_${pkgver}.trusty_amd64.deb" "fuze.png" "fuze.desktop")
md5sums=("2ee8711ac9838e2c2c8029f3a662c538" "f6f754312202f2857b43eb14f278a10c" "0aa6dacb4332c1d0b2e83c5c930f748e")
build() {
        cd "$srcdir"
        tar zxf ./data.tar.gz
}

package() {
        msg "Moving package files into pkg/ directory..."
        mv "${srcdir}/usr" "${pkgdir}/"
        install -Dm 644 "fuze.desktop" "${pkgdir}/usr/share/applications/fuze.desktop"
        install -Dm 644 "fuze.png" "${pkgdir}/usr/share/pixmaps/fuze.png"
}
