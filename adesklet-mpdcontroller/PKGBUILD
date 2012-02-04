# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Stefan Husmann <stefan.husmannt-systems.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-mpdcontroller
pkgver=0.0.4
pkgrel=4
arch=('any')
pkgdesc="mpdcontroller adesklet front end for mpd"
url="http://adesklets.sourceforge.net/desklets.html"
license=('unknown')
depends=('adesklets' 'python-mpdclient')
groups=('adesklet-desklets')
source=(http://www.myfilebin.com/userfiles/cam/mpdcontroller-$pkgver.tar.bz2)
md5sums=('7288d37991e8ba64a83bd7ddec8064cb')

package(){
  cd ${srcdir}/mpdcontroller-$pkgver/

#Python2 fix
  sed -i 's_env python_env python2_' mpdcontroller.py

  install -d ${pkgdir}/usr/share/adesklets/mpdcontroller/images/
  install -m664 -g adesklets CHANGELOG GNUmakefile README \
    ${pkgdir}/usr/share/adesklets/mpdcontroller/
  install -m664 -g adesklets images/* \
    ${pkgdir}/usr/share/adesklets/mpdcontroller/images/
  install -m775 -g adesklets mpdcontroller.py \
    ${pkgdir}/usr/share/adesklets/mpdcontroller/
}
