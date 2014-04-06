# Contributor: HuangCongyu <huangcongyu2006 [at] gmail [dot] com>
# Maintainer.: PG007 <Perfect007Gentleman [at] gmail [dot] com>

pkgname=deadbeef-mpris-plugin
prjname=DeaDBeeF-MPRIS-plugin
pkgver=2.1.5
pkgrel=3
pkgdesc="MPRIS plugin for DeaDBeeF music player"
arch=("i686" "x86_64")
license=('GPL')
url="http://ihacklog.com/post/perfect-lyric-displaying-with-deadbeef-0-5-6-deadbeef-mpris-plugin-and-osd-lyrics.html"
depends=('deadbeef')
source=('git+https://github.com/Jerry-Ma/DeaDBeeF-MPRIS-plugin.git')
md5sums=("SKIP")

build() {
  cd "${srcdir}/${prjname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${prjname}"
  make DESTDIR="${pkgdir}" install
}