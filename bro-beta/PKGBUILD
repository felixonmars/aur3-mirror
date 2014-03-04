# Maintainer: Isaac C. Aronson <i@pingas.org>

pkgname=bro-beta
pkgver=2.2
pkgrel=1
pkgdesc="A highly configurable IDS"
arch=('i686' 'x86_64')
url="http://bro-ids.org/"
backup=(etc/bro/{broccoli.conf,broctl.cfg,networks.cfg,node.cfg})
license=('BSD')
depends=('libpcap' 'ruby' 'file' 'geoip' 'python2')
makedepends=('cmake' 'swig' 'gperftools')
options=('emptydirs')
source=(http://www.bro.org/downloads/release/bro-2.2.tar.gz)
#source=(http://www.bro-ids.org/downloads/beta/bro-2.1-beta.tar.gz)
md5sums=('c116546821bc4aa313fee043c5ac548c')

build() {
  cd $srcdir/bro-$pkgver-beta
  ./configure --prefix="/usr" --conf-files-dir="/etc/bro" --with-python=/usr/bin/python2
  make DESTDIR="$pkgdir"
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir/" install
}
