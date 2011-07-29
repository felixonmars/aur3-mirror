pkgname=abloadtool
pkgver=3.0
pkgrel=1
pkgdesc="abload upload tool"
arch=('i686')
url="http://www.abload.de/tool.php"
license=('LGPL2')
depends=('qt')
source=('http://download.abloadtool.de/linux-32/abloadtool-3.0-i386.tar.gz'
'http://www.abload.de/res/imgs/blog/a5546f805e.jpg'
'abloadtool.desktop')
md5sums=('30c53c269b13d00f44ef8cc3dd7e1244'
         '9cca897331da8068fc1abc28fb450d13'
         '5d1c5b739724da0364e27c698dd85418')

build() {
cd $startdir/src/abloadtool-tar

  install -D -m755 ./abloadtool \
  $pkgdir/usr/bin/abloadtool
  install -D -m644 ./libabload.so \
  $pkgdir/usr/lib/libabload.so

cd $pkgdir/usr/lib

  ln -sf ./libabload.so ./libabload.so.0
  ln -sf ./libabload.so ./libabload.so.0.1
  ln -sf ./libabload.so ./libabload.so.0.1.0

  install -D -m644 $srcdir/abloadtool.desktop \
  $pkgdir/usr/share/applications/abloadtool.desktop
  install -D -m644 $srcdir/a5546f805e.jpg \
  $pkgdir/usr/share/pixmaps/abload-logo.png 

}