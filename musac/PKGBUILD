# Contributor: Ben Eills <beneills0 A LA googlemail TLD com>
pkgname=musac
pkgver=0.3
pkgrel=3
pkgdesc="Python program to manage music.  Encodes, decodes, tags and sorts files into directories using 'locations' and a database."
arch=('i686' 'x86_64')
url="http://www.ziarkaen.org/code/musac.html"
license=('gpl')
depends=('python'
         'mutagen')
optdepends=('flac: for flac support'
            'lame: for mp3 support'
            'faac: for aac support'
            'ffmpeg: for m4a/mp4 support'
            'vorbis-tools: for ogg vorbis support')
source=(http://downloads.sourceforge.net/project/musac/tarballs/${pkgname}-${pkgver}.tar.gz)
md5sums=('697e019f93001e44b7d1aa7bbc9b5c95')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
  make install PREFIX=/usr DESTDIR=${pkgdir}
}
