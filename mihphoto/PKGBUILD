pkgname=mihphoto
pkgver=1.0.6
pkgrel=1
pkgdesc="A touch friendly QT photo viewer."
arch=('any')
url="https://sites.google.com/site/mihplaesu/projects/mihphoto"
license=(GPL)
depends=('qt4' 'kdelibs3')
builddepends=('unsermake')
source=(https://sites.google.com/site/mihplaesu/projects/mihphoto/MihPhoto-source-$pkgver.tgz)

build() {
  cd $srcdir/
  tar -xzzf MihPhoto-source-$pkgver.tgz
  cd MihPhoto/dev/
  qmake-qt4
  make
}

package() {
  install -Dm777 $srcdir/MihPhoto/bin/MihPhoto $pkgdir/opt/MihPhoto/bin/MihPhoto
  mkdir -p $pkgdir/usr/bin/
  ln -s $pkgdir/opt/MihPhoto/bin/MihPhoto $pkgdir/usr/bin/MihPhoto
  mkdir -p $pkgdir/opt/MihPhoto/icons/
  mkdir -p $pkgdir/opt/MihPhoto/images/
  install -D $srcdir/MihPhoto/icons/* -t$pkgdir/opt/MihPhoto/icons/
  install -D $srcdir/MihPhoto/images/* -t$pkgdir/opt/MihPhoto/images/
  install -D $srcdir/MihPhoto/AUTHORS $pkgdir/opt/MihPhoto/
  install -D $srcdir/MihPhoto/COPYING $pkgdir/opt/MihPhoto/
  install -D $srcdir/MihPhoto/CREDITS $pkgdir/opt/MihPhoto/
}

md5sums=('efc5d603ce9385297b0931d04c25bddd')
