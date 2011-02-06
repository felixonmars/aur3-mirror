# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-mounter
pkgver=0.3.2
pkgrel=5
pkgdesc="A simple desklet that allows a user to (un)mount a device and see its free space"
arch=('any')
license=('GPL')
url="http://adesklets.sourceforge.net/desklets.html"
depends=('adesklets')
groups=('adesklet-desklets')
source=(http://downloads.sourceforge.net/adesklets/mounter-$pkgver.tar.bz2)
md5sums=('6376e73d6659f5c02dd468b4be05b3ab')

package() {
  cd ${srcdir}/mounter-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' mounter.py

  install -d ${pkgdir}/usr/share/adesklets/mounter
  cp -r README icons/ ${pkgdir}/usr/share/adesklets/mounter
  chmod -R 644 ${pkgdir}/usr/share/adesklets/mounter
  chown -R :adesklets ${pkgdir}/usr/share/adesklets/mounter
  install -m775 -g adesklets mounter.py ${pkgdir}/usr/share/adesklets/mounter
}
