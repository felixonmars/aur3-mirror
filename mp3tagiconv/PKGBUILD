# CHEN, Xing <cxcxcxcx at gmail.com>

pkgname=mp3tagiconv
pkgver=0.1
pkgrel=2
pkgdesc="Mutagen-based mp3 tag encoding converter. Especially useful for Chinese tags."
arch=('any')
url="http://code.google.com/p/mp3tagiconv/"
license=('GPLv2')
depends=(python2 mutagen)
source=("http://mp3tagiconv.googlecode.com/files/mp3tagiconv_$pkgver.tar.gz" )

md5sums=('d8963a134fcc881088029c4283db2bd6')

build () {
  cd ${srcdir}
  tar xvfz mp3tagiconv_0.1.tar.gz
  cd mp3tagiconv_0.1
  sed -i 's/env\ python/env\ python2/' mp3tagiconv
  install -Dm755 mp3tagiconv $pkgdir/usr/bin/mp3tagiconv
}
