# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=libc-bench
pkgver=20110206
pkgrel=2
pkgdesc="A C library benchmarking tool"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.etalabs.net/libc-bench.html')
source=('http://www.etalabs.net/releases/libc-bench-20110206.tar.gz')
md5sums=('f763de90f95fe68e4e03e5b6f49698ac')
_cflags=('-O2') #change this one to whatever you want to benchmark
_compiler=('gcc')


build() {
  rm -rf $srcdir/build
  cp -ar $srcdir/$pkgname-$pkgver $srcdir/build
  cd $srcdir/build
}

# Feedback welcome in order to add more C libraries to the test
# Is there a way to use uclibc and dietlibc without specific toolchain?

package() {

  msg "the default system glibc"
  _libc="glibc"
  cd $srcdir/build
  make
  mkdir -p $pkgdir/opt/libc-bench/$_libc
  install -m755 $srcdir/build/libc-bench $pkgdir/opt/libc-bench/$_libc/
  rm -rf $srcdir/build

  msg "the default system glibc static compile"
  _libc="glibc-static"
  export CFLAGS="$_cflags -static"
  cp -ar $srcdir/$pkgname-$pkgver $srcdir/build  
  cd $srcdir/build
  make
  mkdir -p $pkgdir/opt/libc-bench/$_libc
  install -m755 $srcdir/build/libc-bench $pkgdir/opt/libc-bench/$_libc/
  rm -rf $srcdir/build

# Below, various tests depending on which C-libraries that are installed

  if [ -d /usr/local/musl ]; then
      msg "musl libc"
      _libc="musl"
      export CFLAGS="$_cflags"
      export CC="musl-$_compiler"
      cp -ar $srcdir/$pkgname-$pkgver $srcdir/build  
      cd $srcdir/build
      make
      mkdir -p $pkgdir/opt/libc-bench/$_libc
      install -m755 $srcdir/build/libc-bench $pkgdir/opt/libc-bench/$_libc/
      rm -rf $srcdir/build
  else
      msg "no musl libc found on the system"
  fi

  if [ -d /usr/local/musl ]; then
      msg "musl libc static compile"
      _libc="musl-static"
      export CFLAGS="$_cflags -static"
      export CC="musl-$_compiler"
      cp -ar $srcdir/$pkgname-$pkgver $srcdir/build  
      cd $srcdir/build
      make
      mkdir -p $pkgdir/opt/libc-bench/$_libc
      install -m755 $srcdir/build/libc-bench $pkgdir/opt/libc-bench/$_libc/
      rm -rf $srcdir/build
  else
      msg "no musl libc found on the system"
  fi
}