# Maintainer: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=rev-plugins
_pkgname=REV-plugins
pkgver=0.3.1
pkgrel=5
pkgdesc="LADSPA stereo reverb plugin based on the well-known greverb."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/ladspa/"
license=('GPL')
depends=('gcc-libs')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$_pkgname-$pkgver.tar.bz2)
md5sums=('bca920c2cbf5e33989e7cafab6fbaee4')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm 755 g2reverb.so ${pkgdir}/usr/lib/ladspa/g2reverb.so
}
