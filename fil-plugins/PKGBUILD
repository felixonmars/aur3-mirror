# Maintainer: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=fil-plugins
_pkgname=FIL-plugins
pkgver=0.3.0
pkgrel=6
pkgdesc="LADSPA four-band parametric equaliser plugins"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/ladspa/"
license=('GPL')
depends=('gcc-libs')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$_pkgname-$pkgver.tar.bz2)
md5sums=('39f34be516752a9740a65547e1128124')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm 755 filters.so $pkgdir/usr/lib/ladspa/filters.so
}
