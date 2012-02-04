# Contributor: Jan Blazek <appolito@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=tagger
pkgver=0.2.7
pkgrel=2
pkgdesc="Command line Ogg/Vorbis and MP3 ID3 version 1 and 1.1 tag-editor."
arch=(i686)
url="http://onion.dynserv.net/~timo/tagger.html"
license=('GPL')
depends=('libvorbis')
source=(http://onion.dynserv.net/~timo/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b5535b3f22a899ceb1728617b190f13f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure
  make || return 1
  install -D -m775 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname} || return 1
}
