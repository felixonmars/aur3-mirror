# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=adesklet-mldonkeycontol
pkgver=0.1.0
pkgrel=2
pkgdesc="A mldonkey monitoring desklet"
arch=('any')
license=('GPL')
url="http://adesklets.sourceforge.net/desklets.html"
depends=('adesklets')
groups=('adesklet-desklets')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/MldonkeyContol-${pkgver}.tar.bz2)
md5sums=('133526d5e876a6b7779e35a03dc34227')

package() {
  cd ${srcdir}/MldonkeyContol-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' MldonkeyContol.py

  install -d ${pkgdir}/usr/share/adesklets/mldonkeycontol
  cp -a ${srcdir}/MldonkeyContol-$pkgver/* ${pkgdir}/usr/share/adesklets/mldonkeycontol/
  chmod 755 ${pkgdir}/usr/share/adesklets/mldonkeycontol/MldonkeyContol.py
  chown -R :adesklets ${pkgdir}/usr/share/adesklets/mldonkeycontol
}
