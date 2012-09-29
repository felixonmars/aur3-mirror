pkgname="zqr"
pkgver="0.0.0"
url="http://code.google.com/p/loopboot"
source=('zqr.tar.xz')
sha512sums=('2229c87a786e0253812b3074b082c79dec430e04ee739e0e0bb31d0fe94e59a7271a2fa26478d0cde5af10f16809dcd0b32d66ba85f7a1414415b298f7a3feed')
pkgrel="0"
pkgdesc="A qr code make tool gui by TuxZZ."
arch=('any')
license="GPL2"
depends=('zenity'
'qrencode'
'libpng'
)
package()
{
mkdir -p ${pkgdir}/usr/share/applications
mkdir -p ${pkgdir}/usr/share/pixmaps
mkdir -p ${pkgdir}/usr/bin
cp ${srcdir}/qr.png ${pkgdir}/usr/share/pixmaps/
cp ${srcdir}/zqr.desktop ${pkgdir}/usr/share/applications/
cp ${srcdir}/zqr ${pkgdir}/usr/bin/
chmod 755 ${pkgdir}/usr/bin/zqr
}