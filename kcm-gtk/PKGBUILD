# Maintainer: Vinycius Maia <suportevg@uol.com.br>
# Contribuitor: Tayhe <admin at tayhe dotcom>

pkgname=kcm-gtk
pkgver=0.5.3
_relseries=0.5.x
pkgrel=2
pkgdesc="A GTK appearance KConfig Module"
arch=('i686' 'x86_64')
url="https://launchpad.net/kcm-gtk"
license=("GPL")
depends=('kdelibs>=4.2')
makedepends=('cmake' 'automoc4')
provides=('gtk-qt-engine')
conflicts=('gtk-qt-engine')
source=(http://launchpad.net/kcm-gtk/$_relseries/$pkgver/+download/kcm-gtk_$pkgver.orig.tar.gz)
md5sums=('b49e2df3cce3bcb8c6dc96e7af73716d')

build() {
  cd "${srcdir}/kcm-gtk-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX="`kde4-config --prefix`" .
  make
}

package() {
  cd "${srcdir}/kcm-gtk-$pkgver"
  make DESTDIR="${pkgdir}" install
}
