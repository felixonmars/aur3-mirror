# Maintainer: Glebushka <glebtv@gmail.com>
pkgname=smb4k-svn
pkgver=1367098
pkgrel=1
pkgdesc="A KDE program that browses samba shares"
arch=('i686' 'x86_64')
url="http://smb4k.berlios.de/"
license=('GPL')
groups=()
depends=('kdebase-runtime' 'cmake' 'automoc4')
makedepends=('subversion')
provides=('smb4k')
conflicts=('smb4k')
source=('smb4k::svn://anonsvn.kde.org/home/kde/trunk/playground/network/smb4k')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/smb4k"
  svnversion
}

build() {
  cd "$srcdir/smb4k"
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
	  -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/smb4k"
  make DESTDIR="$pkgdir" install
}
