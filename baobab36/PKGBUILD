pkgname=baobab36
pkgver=3.6.0
pkgrel=3
pkgdesc="Old version of baobab package without client side decorations"
url="https://launchpad.net/ubuntu/quantal/+source/baobab"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('desktop-file-utils' 'gtk3')
optdepends=()
makedepends=('intltool' 'itstool')
conflicts=('baobab' 'baobab-git')
replaces=('baobab')
provides=('baobab=3.6.0')
backup=()
install='baobab36.install'
source=(https://launchpad.net/ubuntu/quantal/+source/baobab/3.6.0-0ubuntu1/+files/baobab_3.6.0.orig.tar.xz)
md5sums=('799d3b9d5e305487bf933fd538b43425')
 
build() {
  cd "${srcdir}/baobab-${pkgver}"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/baobab-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
