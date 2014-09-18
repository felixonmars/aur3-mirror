# submitter: perlawk

pkgname=torch-svm
pkgver=1.0
pkgrel=1
pkgdesc="SVM packages for Torch7,lua5.1, luajit"
arch=(i686 x86_64)
url="https://github.com/koraykv/torch-svm"
license=('GPL')
depends=('liblinear')
source=("torch-svm-master.zip::https://codeload.github.com/koraykv/torch-svm/zip/master"
'test.lua')

build() {
  cd "$srcdir/$pkgname-master"/
  mkdir -p build; cd build; 
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make -j2
}

package() {
  cd "$srcdir/$pkgname-master"/
  cd build
  make DESTDIR=$pkgdir/ install
  rm -f $pkgdir/usr/share/torch/dok/index.txt
  rm -f $pkgdir/usr/share/torch/dokindex.lua
  rm -f $pkgdir/usr/share/torch/html/index.html
}
md5sums=('e1ec062851aed133f0047ff585417b58'
         'f262a8a8c27e688373178c1b626ff355')
