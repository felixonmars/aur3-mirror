# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Predrag Radovic <predrg@gmail.com>
pkgname=python-pyspeex
pkgver=0.2
pkgrel=1
pkgdesc="A python interface to Speex"
url="http://www.freenet.org.nz/python/pySpeex"
depends=('python2' 'speex')
makedepends=('pyrex')
conflicts=('pyspeex')
provides=('pyspeex')
license=('unknown')
source=(http://www.freenet.org.nz/python/pySpeex/pySpeex-$pkgver.tar.gz \
	    float-to-short.patch true-false.patch)
arch=('i686')
md5sums=('5f6837cd74568fb58bb15d43fe2406ea'
         '50629a3b4305458d78c63ac31d6826db'
         '5e0a5ea731300010223d500ef5618572')
build() {
  cd $startdir/src/pySpeex-0.2
  patch -p0 -i "${srcdir}/true-false.patch" || return 1
  patch -p0 -i "${srcdir}/float-to-short.patch" || return 1
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
