# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=mp3plot
pkgver=0.5.1
pkgrel=1
pkgdesc="Creates a textual or graphical plot of an MP3 file's bitrate distribution"
arch=('i686' 'x86_64')
url="http://p.outlyer.net/$pkgname/"
license=('GPL')
depends=('boost>=1.34.1' 'gd' 'imagemagick')
makedepends=('pkgconfig>=0.9')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=('20d1e6b21926b9d42412eae37fe1cf91')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
