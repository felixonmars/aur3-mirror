# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=python-tenjin
pkgver=0.9.0
pkgrel=1
pkgdesc="The Fastest template engine in the world. Python implementation."
arch=('i686' 'x86_64')
url="http://www.kuwata-lab.com/tenjin/"
license=('MIT')
depends=('python' 'setuptools')
source=(http://downloads.sourceforge.net/sourceforge/tenjin/Tenjin-${pkgver}.tar.gz)
md5sums=('f7966d8dfd8f24f3ae410c8d8ba34159')



build() {
  cd $startdir/src/Tenjin-$pkgver
  python setup.py install --root $startdir/pkg || return 1
  install -D -m644 MIT-LICENSE $startdir/pkg/usr/share/licenses/python-tenjin/COPYING
  install -D -m644 README.txt $startdir/pkg/usr/share/python-tenjin/README.txt
  /bin/cp -r doc $startdir/pkg/usr/share/python-tenjin/doc
  /bin/cp -r examples $startdir/pkg/usr/share/python-tenjin/examples
  /bin/cp -r benchmark $startdir/pkg/usr/share/python-tenjin/benchmark
}
