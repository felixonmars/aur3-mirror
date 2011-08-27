# Contributor: Dima Moroz <foomor@gmail.com>
pkgname=kdedecor-nitrogen-minimal-kde4
pkgver=0.1
pkgrel=1
pkgdesc="KDE Kwin Window Decoration"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=109355"
license=("GPL")
depends=('kdelibs>=4.3')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/109355-kde4-nitrogen-minimal.tar.gz)
md5sums=('d133c4e60f541d9c921b1a2a8f3048d9')

build() {
  cd kde4-nitrogen-minimal
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
