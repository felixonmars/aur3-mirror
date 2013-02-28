# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=python-liblinear
pkgver=1.93
pkgrel=1
_python2_version=2.7
_python3_version=3.3

pkgdesc='A Library for Large Linear Classification'
arch=('x86_64' 'i686')
url="http://www.csie.ntu.edu.tw/~cjlin/libsvm/"
license=('custom')
conflicts=('liblinear')
provides=('liblinear')
source=("http://www.csie.ntu.edu.tw/~cjlin/cgi-bin/liblinear.cgi?+http://www.csie.ntu.edu.tw/~cjlin/liblinear+tar.gz")
md5sums=('5ca3c8e9bb2ec5661aa77221b206e296')

#Broken link
#source+=("http://www.csie.ntu.edu.tw/~cjlin/liblinear/COPYRIGHT") 

_python2_path="$pkgdir/usr/lib/python$_python2_version"
_python3_path="$pkgdir/usr/lib/python$_python3_version"

build() {
  cd "$srcdir/liblinear-$pkgver"
  make lib all
}

package() {
  cd "$srcdir/liblinear-$pkgver"

  # command line interface
  #install -D -m755 train          $pkgdir/usr/bin/liblinear-train
  #install -D -m755 predict        $pkgdir/usr/bin/liblinear-predict

  install -D -m644 linear.h       $pkgdir/usr/include/linear.h

  install -D -m644 README         $pkgdir/usr/share/doc/liblinear/readme.txt
  install -D -m644 python/README  $pkgdir/usr/share/doc/liblinear/python.txt
  echo "cf ${url}" > ../COPYRIGHT
  install -D -m644 ../COPYRIGHT   $pkgdir/usr/share/licenses/python-liblinear/LICENSE

  # C library
  install -D -m644 liblinear.so.1 $pkgdir/usr/lib/liblinear.so.1
  cd $pkgdir/usr/lib/
  ln -s liblinear.so.1 liblinear.so 
  # python bindings
  cd "$srcdir/liblinear-$pkgver/python"

  install -D -m644 liblinear.py     $_python2_path/liblinear.py
  install -D -m644 liblinearutil.py $_python2_path/liblinearutil.py
  install -D -m644 liblinear.py     $_python3_path/liblinear.py
  install -D -m644 liblinearutil.py $_python3_path/liblinearutil.py
}

