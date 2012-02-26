# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Hugo Ideler <hugoideler@dse.nl>

pkgname=adesklet-systemmonitor
pkgver=0.1.3
pkgrel=5
pkgdesc="Modular stackable system monitors for adesklets"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL2')
depends=('adesklets' 'libstatgrab' 'pystatgrab')
backup=('usr/share/adesklets/SystemMonitor/config.txt')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/SystemMonitor-$pkgver.tar.bz2)
sha256sums=('dcd290c7c4915326396528d6eb56bef71d9d8a7865edb4e1501cbc233a0d855d')

package() {
  install -d -m 755 "${pkgdir}/usr/share/adesklets/SystemMonitor"
  cp -a  "${srcdir}"/SystemMonitor-$pkgver/* "${pkgdir}/usr/share/adesklets/SystemMonitor/"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/SystemMonitor/SystemMonitor.py"
  chown root:adesklets "${pkgdir}/usr/share/adesklets/SystemMonitor/config.txt"
  chmod 664 "${pkgdir}/usr/share/adesklets/SystemMonitor/config.txt"
  rm "${pkgdir}/usr/share/adesklets/SystemMonitor/config.txt~"
}
