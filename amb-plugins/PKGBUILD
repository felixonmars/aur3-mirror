# Maintainer: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=amb-plugins
_pkgname=AMB-plugins
pkgver=0.6.1
pkgrel=2
pkgdesc="LADSPA plugins of various improved decoders"
arch=('i686' 'x86_64')
url="http://kokkinizita.net/linuxaudio/ladspa/"
license=('GPL')
source=(http://kokkinizita.net/linuxaudio/downloads/$_pkgname-$pkgver.tar.bz2)
md5sums=('482232250a93058a47cc85293c977e38')

build() {
  cd $srcdir/$_pkgname-$pkgver
  
  make || return 1
  install -d $pkgdir/usr/lib/ladspa/
  install -m 755 *.so $pkgdir/usr/lib/ladspa/ || return 1
}
