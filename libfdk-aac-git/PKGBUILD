# Maintainer: PelPix <kylebloss[at]pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=libfdk-aac-git
_gitname="libfdk-aac"
pkgver=v0.1.3.0.g2f29dd4
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('custom')
depends=('glibc')
provides=('libfdk-aac')
makedepends=('git')
conflicts=('libfdk-aac')
options=('!libtool')
source=('libfdk-aac::git://git.code.sf.net/p/opencore-amr/fdk-aac')
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's|-|.|g'
}

build() {
  cd "$_gitname"
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
