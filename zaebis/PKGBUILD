# Contributor: goom <psylinuxoid@gmail.com>
pkgname=zaebis
pkgver=1.1
pkgrel=2
pkgdesc="Simple program which makes everything well. Paradoxically it works only in Russia."
arch=(i686 x86_64)
url="http://www.qt-apps.org/content/show.php/Zaebis?content=102362"
license=('GPL')
groups=(games)
depends=(qt)
source=(http://www.qt-apps.org/CONTENT/content-files/102362-good.tar.gz)
md5sums=('04c252d6517347ab67c2cb5e47028b51')
build() {
  cd "$startdir/src"
  qmake || return 1
  make || return 1
  cd $startdir/pkg
  mkdir usr 
  mkdir ./usr/bin 
  cp $startdir/src/good $startdir/pkg/usr/bin/zaebis
}
