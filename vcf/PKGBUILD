# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=vcf
pkgver=0.0.5
pkgrel=1
pkgdesc="LADSPA audio EQ biquad filters based on the cookbook formulae by Robert Bristow-Johnson"
arch=('i686' 'x86_64')
url="http://www.suse.de/~mana/ladspa.html"
license=('LGPL')
depends=('glibc')
source=(http://www.suse.de/~mana/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7dfbdd040926f925187290c5d12caeae')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
  mkdir -p "${pkgdir}/usr/lib/ladspa/"
  install -m755 *.so "${pkgdir}/usr/lib/ladspa/" || return 1
}
