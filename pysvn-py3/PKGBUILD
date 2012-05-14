# Maintainer: Viacheslav Chimishuk <voice@root.ua>

pkgname=pysvn-py3
pkgver=1.7.6
pkgrel=1
pkgdesc="Python3 SVN Extension."
url="http://pysvn.tigris.org"
depends=('python>=3.1.3' 'subversion' 'apr' 'expat' 'neon' 'openssl')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('APACHE')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz")
md5sums=('010a80f0058713209d62e96b20afbde9')
build() {
  _pyver=`python3 -V 2>&1|sed -e 's/.* 3\.\([0-9]\).*/\1/'`
  cd $srcdir/pysvn-$pkgver
  cd $srcdir/pysvn-$pkgver/Source
  python3 setup.py configure || return 1
  make || return 1
  install -D -m644 pysvn/__init__.py $pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/__init__.py
  install -D -m755 pysvn/_pysvn_3_${_pyver}.so $pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/_pysvn_3_${_pyver}.so
}
# vim: set ts=2 sw=2 et:
