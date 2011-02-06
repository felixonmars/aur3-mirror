# Contributor: nbags <neilbags@gmail.com>

pkgname=fortune-mod-dubya
pkgver=1
pkgrel=1
pkgdesc="Fortune cookies: George W. Bush Quotes."
arch=(i686 x86_64)
depends=(fortune-mod)
source="http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles/Dubya-20050118.tar.gz"
url="http://dubya.seiler.us/"
md5sums=(e4e545bdfffc4bf43ef45bdf18a154ae)

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/fortune
  cp dubya/dubya* $startdir/pkg/usr/share/fortune
}
