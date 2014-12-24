# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Maintainer:  Jesse Jaara	<jesse.jaara@gmail.com>

pkgname=gnurobbo-data-nonfree
pkgver=0.66
pkgrel=2
pkgdesc="Non-free game data for GNURobbo"
arch=('any')
url="http://gnurobbo.sourceforge.net/"
license=('unknown')
changelog=ChangeLog
depends=('gnurobbo')
source=(http://downloads.sourceforge.net/gnurobbo/gnurobbo-$pkgver-source.tar.gz)

package() {
  cd "${srcdir}/gnurobbo-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/gnurobbo/skins"
  cp -f  data/levels/original.dat  "${pkgdir}/usr/share/gnurobbo/"
  cp -rf data/skins/original/      "${pkgdir}/usr/share/gnurobbo/skins/"
}

# vim:set ts=2 sw=2 et:
md5sums=('77fdf9a186a08c1f95b94bd35ebbc21c')
