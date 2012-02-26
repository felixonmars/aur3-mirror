# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Hugo Ideler

pkgname=adesklet-asimpleclock
pkgver=0.0.3
pkgrel=8
pkgdesc="A simple little desklet that displays a text-based digital clock."
arch=('any')
url="http://www.pirnat.com/geek/adesklets.shtml"
license=('GPL2')
depends=('adesklets')
source=(http://mike.pirnat.com/static/asimpleclock-$pkgver.tar.bz2)
sha256sums=('34a0dabd48cb78a54695d92b8762778d4edf39695443d59904fcf64b9c13ed8c')

package() {
  install -d -m 755 "${pkgdir}/usr/share/adesklets/asimpleclock"
  cp -a "${srcdir}"/asimpleclock-$pkgver/* "${pkgdir}/usr/share/adesklets/asimpleclock/"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/asimpleclock/asimpleclock.py"
  chown root:adesklets "${pkgdir}/usr/share/adesklets/asimpleclock"
  chmod 775 "${pkgdir}/usr/share/adesklets/asimpleclock"
}
