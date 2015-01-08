# Contributor: Rafal Michalski <plum.michalski@gmail.com>, Thomas Laroche <tho.laroche@gmail.com>
pkgname=justniffer
pkgver=0.5.12
pkgrel=1
pkgdesc="justniffer is a TCP sniffer. It reassembles and reorders packets and displays the tcp flow in a customizable way."
arch=('i686' 'x86_64')
url="http://justniffer.sourceforge.net"
license=('GPL')
depends=('libnids' 'python2>=2.4' 'libpcap' 'boost')
source=("http://waix.dl.sourceforge.net/project/justniffer/justniffer/$pkgname%20$pkgver/${pkgname}_$pkgver.tar.gz")
sha256sums=(
'e5bb7a1c3cfc72314b8686cbb121d2c4fbf2dd0484a7e564e67d6bb880ee3329' # justniffer_0.5.12.tar.gz
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  #Use python 2.x instead of 3.x
  sed s/python/python2/ -i python/*.py
  sed s/python/python2/ -i python/justniffer-grab-http-traffic.in
  sed 's/do_subst = python/do_subst = python2/' -i python/Makefile.*

 autoreconf --force --install

}

build() {
  cd "$srcdir/$pkgname-$pkgver"


  CXXFLAGS="-O2" && CFLAGS="-O2" && LDFLAGS="-Wl,-z,defs" && ./configure --enable-dependency-tracking --enable-python --prefix=/usr --sbindir=/usr/bin PYTHON="python2" || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

}

# vim:set ts=2 sw=2 et:
