# Maintainer: Andrew Trabo <v01d3r@gmail.com>
pkgname=peyote
pkgver=0.9.12
pkgrel=1
pkgdesc="An audio player with friendly MC-like interface"
url="http://peyote.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python2' 'mutagen' 'gstreamer0.10-python' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'pygobject' 'python2-pyinotify' 'rxvt-unicode')
makedepends=('pygobject2-devel')
optdepends=('gstreamer0.10-bad-plugins: for additional functionality')
source=("http://downloads.sourceforge.net/project/peyote/Linux/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('62180b2ba63b0d99ef27bb7753304c08cf557534f7bab7586dd37fdbe6f9e76f')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
