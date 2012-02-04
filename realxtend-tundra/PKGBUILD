pkgname=realxtend-tundra
pkgver=1.0.7
pkgrel=1
pkgdesc="RealXtend Tundra is a platform for networked 3d applications"
url="http://realxtend.wordpress.com/"
arch=('x86_64')
license=('Apache2')
depends=('deb2targz' 'ogre-branch-1.6')
source=( http://realxtend-naali.googlecode.com/files/realXtend-tundra-${pkgver}-ubuntu-natty-amd64.deb )
sha256sums=('8d9c30699c5d15206380901ebc429183dc0a354871142564073423aac67f31d9')

package() {
cd "$srcdir"
msg "Extracting the RealXtend Tundra package"
ar -xv realXtend-tundra-${pkgver}-ubuntu-natty-amd64.deb
tar -xvf data.tar.gz
msg2 "Done extracting!"

msg "Preparing install"
install -d "$pkgdir"/{opt,usr/{share/applications}}
mv -v opt/realxtend-tundra "$pkgdir"/opt
msg2 "Done preparing!"

msg "Actual installation"

}
