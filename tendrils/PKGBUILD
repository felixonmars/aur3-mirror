# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: mpie <michael dot kyne dash phillips1 at ntlworld dot com>

pkgname=tendrils
pkgver=20110130
pkgrel=1
pkgdesc="A RPG game where the combat sequences are played out ddr stylee!!"
url="http://necrofamicon.com/Tendrils/"
arch=('any')
depends=('python2' 'python-pygame' 'libvorbis' 'libtiff' 'libpng12' 'sdl' 'sdl_mixer')
license=('None')
install=tendrils.install
source=('http://necrofamicon.com/Tendrils/Tendrils.20110130.zip')
md5sums=('fa3d6fab282ed4d9cc41e43d649b8191')
noextract=('Tendrils.20110130.zip')

build() {
mkdir -p ${pkgdir}/usr/share/tendrils
mkdir -p ${pkgdir}/usr/bin
unzip -x ${srcdir}/Tendrils.${pkgver}.zip -d ${pkgdir}/usr/share/tendrils/
echo \#\!/bin/bash > ${pkgdir}/usr/bin/tendrils
echo cd /usr/share/tendrils/ >> ${pkgdir}/usr/bin/tendrils
echo python2 Tendrils.py >> ${pkgdir}/usr/bin/tendrils
chmod +x ${pkgdir}/usr/bin/tendrils
rm -rf ${pkgdir}/usr/share/tendrils/{*.exe,*.dll}
}
