# Contributor: Fedor Suchkov <f.suchkov@gmail.com>
pkgname=aku
pkgver=1.0_beta1
pkgrel=2
pkgdesc="aKu - yes the K stands also for KDE application - is a rar - the compression command line utility - GUI. With aKu you can decompress rar files and create new archives in a very simple way."
arch=('i686' 'x86_64')
url="http://akublog.wordpress.com/"
license=('GPL3')
groups=()
depends=('kdelibs>=4.1.0' 'qt>=4.4.0' 'unrar')
makedepends=('cmake' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.webalice.it/frgrieco/$pkgname-1.0_beta1.tar.bz2)
noextract=()
md5sums=(6f8ee5bea4be9b8c4bcc15ac0d675fac)

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR="$pkgdir/" install
}
