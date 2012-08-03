# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=vidalia-alpha
pkgver=0.3.1
pkgrel=2
pkgdesc="Controller GUI for Tor"
url="https://www.torproject.org/vidalia"
arch=('i686' 'x86_64')
provides="vidalia"
license=('GPL')
depends=('qt' 'tor')
makedepends=('cmake')
install=vidalia.install
source=("https://www.torproject.org/vidalia/dist/vidalia-$pkgver.tar.gz")
sha1sums=('724fa169bf29c309cb96b16d47b66701ed2751f2')

build() {
  [[ -f /etc/profile.d/qt4.sh ]] && source /etc/profile.d/qt4.sh
  rm -rf ${srcdir}/build
  cd "$srcdir"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=ON ../vidalia-$pkgver

  # This is not a legitimate fix, but it does allow it to compile!
  sed -i 's^!::sleep(s);^//!::sleep(s);^g' ${srcdir}/vidalia-${pkgver}/src/vidalia/plugin/PluginEngine.cpp

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../vidalia-$pkgver/doc/vidalia.1 "$pkgdir"/usr/share/man/man1/vidalia.1 || return 1

}
