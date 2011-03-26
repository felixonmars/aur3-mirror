# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-volume
pkgver=0.0.8
pkgrel=5
pkgdesc="A Volume control desklet"
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL2')
arch=('any')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/volume/config.txt')
source=(volume-$pkgver.tar.bz2)
#original location dead - http://markbokil.org/downloads/adesklets/volume-$pkgver.tar.bz2)
md5sums=('7e5b0e2afdb619a16dd1a834b327984f')

package() {
  cd ${srcdir}/volume-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' volume.py

  install -d ${pkgdir}/usr/share/adesklets/volume/images/{blue,brushed,dark,default,graphite,simple}

  install -m664 -g adesklets COPYING GNUmakefile README config.txt \
    ${pkgdir}/usr/share/adesklets/volume
  install -m775 -g adesklets volume.py ${pkgdir}/usr/share/adesklets/volume

  install -m664 -g adesklets images/blue/* \
    ${pkgdir}/usr/share/adesklets/volume/images/blue
  install -m664 -g adesklets images/brushed/* \
    ${pkgdir}/usr/share/adesklets/volume/images/brushed
  install -m664 -g adesklets images/dark/* \
    ${pkgdir}/usr/share/adesklets/volume/images/dark
  install -m664 -g adesklets images/default/* \
    ${pkgdir}/usr/share/adesklets/volume/images/default
  install -m664 -g adesklets images/graphite/* \
    ${pkgdir}/usr/share/adesklets/volume/images/graphite
  install -m664 -g adesklets images/simple/* \
    ${pkgdir}/usr/share/adesklets/volume/images/simple
}
