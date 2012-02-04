# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=bmp-scrobbler
_pkgname=xmms-scrobbler
pkgver=0.3.8.1
pkgrel=1
pkgdesc="Audioscrobbler plugin for BMP"
arch=(i686 x86_64)
url="http://www.last.fm/postsignup.php"
license=('LGPL-2.1')
depends=('bmp' 'musicbrainz' 'curl')
makedepends=('bc')
source=(http://www.pipian.com/stuffforchat/$_pkgname-$pkgver.tar.bz2)
md5sums=('e933c7660fe9103916ca022ec60ad654')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  ./configure --prefix=/usr --disable-xmms-plugin
  make || return 1
  make prefix=$startdir/pkg/usr bmplibdir=$startdir/pkg/usr/lib/bmp/General install || return 1

  # libtool slay
  find $startdir/pkg -name *.la -exec rm {} \;
}
