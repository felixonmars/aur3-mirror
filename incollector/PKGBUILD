# Contributor: Kevin Peters <65boney@gmail.com>
# Contributor: Bogdan Szczurek <bodzi-o@wp.pl>

pkgname=incollector
pkgver=1.2
pkgrel=3
pkgdesc='An application to collect various kinds of information'
arch=('any')
url='http://www.incollector.devnull.pl/'
license=('GPL')
depends=('gtk-sharp-2>=2.10')
source=(http://www.incollector.devnull.pl/download/sources/incollector-$pkgver.tar.gz stats-dialog-1.2.patch)
md5sums=('6701ac13da29119cd6719be3edcf30aa'
         '94b448a192b005e7644c891b317d691b')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  patch -d $startdir/src/incollector-$pkgver/src/GUI < stats-dialog-1.2.patch

  cd $startdir/src/incollector-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -r $MONO_SHARED_DIR
}
