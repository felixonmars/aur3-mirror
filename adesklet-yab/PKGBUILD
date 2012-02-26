# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=adesklet-yab
pkgver=0.0.2
pkgrel=7
pkgdesc="yab (Yet Another Bar) is a very plain launch bar, yet reasonably polished, highly configurable and resources limit aware"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL2')
depends=('adesklets')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/yab-$pkgver.tar.bz2)
sha256sums=('dac57c6c5141297c118fbcc834de76fb30de04b4ba7b02b17711ba7ed2654982')

package() {
  install -d -m 755 "${pkgdir}/usr/share/adesklets/yab"
  cp -a  "${srcdir}"/yab-$pkgver/* "${pkgdir}/usr/share/adesklets/yab/"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/yab/yab.py"
  chown root:adesklets "${pkgdir}/usr/share/adesklets/yab"
  chmod 775 "${pkgdir}/usr/share/adesklets/yab"
}
