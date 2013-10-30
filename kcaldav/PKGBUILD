# Contributor: habarnam <marius@habarnam.ro >
pkgname=kcaldav
pkgver=1.2.0
fullver=$pkgver
pkgrel=2
pkgdesc="CalDAV support for KOrganizer"
arch=('i686' 'x86_64')
url="http://kcaldav.googlecode.com/"
license=("GPL")
depends=('kdelibs' 'kdepimlibs')
makedepends=('cmake' 'automoc4')
source=(http://kcaldav.googlecode.com/files/$pkgname-$fullver.tar.gz)
    
md5sums=('3a5e9fbbdbd8e65255d0418b4cbde30d')

build() {
  cd $pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
