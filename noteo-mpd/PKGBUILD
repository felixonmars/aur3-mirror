# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-mpd
pkgver=0.0.2
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A noteo module which monitors mpd and notifies of song changes"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "python-mpd" "mpd")
install=noteo-mpd.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('b84a3d9e89f6f3cdd02075483b5f04a7')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv MPD $startdir/pkg/usr/share/noteo/
}
