# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=pycudd
pkgver=2.0.1
pkgrel=4
pkgdesc="enhanced Python interface to the Colorado University BDD package, CUDD."
arch=('i686' 'x86_64')
url="http://www.ece.ucsb.edu/bears/pycudd.html"
license=('unknown')
depends=("cudd>=2.4.1")
makedepends=(gcc python swig)
source=("http://bears.ece.ucsb.edu/ftp/pub/pycudd2.0/$pkgname$pkgver.tgz"
Makefile
setup.py
  )

build() {
  cp Makefile "$srcdir/$pkgname/"
  cp setup.py "$srcdir/$pkgname/"
  cd "$srcdir/$pkgname"
  make  depend|| return 1
  make 
  make || return 1
  make docs
  python setup.py install --prefix=$pkgdir/usr 
  install -c _pycudd.so  $pkgdir/usr/lib/python2.6/site-packages/_pycudd.so

  mkdir -p $pkgdir/usr/share/pycudd/doc
  cp -r doc/*  $pkgdir/usr/share/pycudd/doc
  cp -r README UNIMPLEMENTED example*  $pkgdir/usr/share/pycudd/doc
  chmod -R go+r $pkgdir/usr/share/pycudd
  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
