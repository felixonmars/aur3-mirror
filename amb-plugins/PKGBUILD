# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Wido <widomaker2k7@gmail.com>

_name=AMB-plugins
pkgname=amb-plugins
pkgver=0.8.1
pkgrel=1
pkgdesc="LADSPA ambisonics plugins of various improved decoders"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
groups=('ladspa-plugins')
source=("${url}downloads/$_name-$pkgver.tar.bz2")
md5sums=('496d8d2bf6036611b6b4aa7f56325a52')

build() {
  cd "$srcdir/$_name-$pkgver"
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  # plugins
  install -d "$pkgdir/usr/lib/ladspa"
  install -Dm755 *.so "$pkgdir/usr/lib/ladspa"
}
