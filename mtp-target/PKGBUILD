# Contributor: Nicoco <truenicoco_nospam_at_gmail_dot_com>
# Maintainer: Jelle van der Waa <jelle_vdwaa_nospam_at_gmail_dot_com>
pkgname=mtp-target
pkgver=1.9
pkgrel=2
pkgdesc="Mtp Target"
arch=(i686 x86_64)
url="http://www.mtp-target.org"
depends=(glibc libx11 libxxf86vm libgl gcc-libs libxcb libxext libxdamage libxfixes libdrm libxau libxdmcp)
license=('GPL')
source=(http://www.mtp-target.org/files/mtp-target-setup.19.tar.bz2 mtptarget mtp-target.desktop mtp-target.png)
md5sums=('1c3f1d2481678ce2d5bac7bff47b027d' '75f6c1ba5281c0af9b01c92dc98b2d2e' '400935827963d94477ac3cddfc370c64' '9e7580f65a545a6c0fcd5f361beb446e')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libstdc++5' 'lib32-libxext' 'lib32-libxcb' 'lib32-libgl' 'lib32-libdrm' 'lib32-libxdamage' 'lib32-libxau' 'lib32-libxfixes' 'lib32-libxxf86vm') && optdepends=('lib32-nvidia-utils or an lib32-libgl for intel/ati')
build() {
mkdir -p $pkgdir/opt/mtp-target
cp $srcdir/mtp-target/* $pkgdir/opt/mtp-target -R

install -D -m 755 $srcdir/mtptarget $pkgdir/usr/bin/mtp-target
install -D -m 644 $srcdir/mtp-target.png $pkgdir/usr/share/pixmaps/mtp-target.png
install -D -m 644 $srcdir/mtp-target.desktop $pkgdir/usr/share/applications/mtp-target.desktop
}
