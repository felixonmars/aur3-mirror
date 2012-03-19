# Contributor: Edvinas Valatka <edacval@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pysvn-py2
pkgver=1.7.6
pkgrel=1
pkgdesc="Python2 SVN Extension."
url="http://pysvn.tigris.org"
#install=pysvn-py2.install

depends=('python2>=2.7' 'subversion' 'apr' 'expat' 'neon' 'openssl')

conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('APACHE')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz")
md5sums=('010a80f0058713209d62e96b20afbde9')
build() {
  _pyver=`python2 -V 2>&1|sed -e 's/.* 2\.\([0-9]\).*/\1/'`
  cd $srcdir/pysvn-$pkgver/Source

##################################################################
# =>  Include svn_version.h in top of file pysvn_svnenv.hpp !!
#  echo '#include <svn_version.h>' > pysvn_svnenv.new
#  cat pysvn_svnenv.hpp >> pysvn_svnenv.new
#  rm pysvn_svnenv.hpp
#  mv pysvn_svnenv.new pysvn_svnenv.hpp

  python2 setup.py backport || return 1
  python2 setup.py configure || return 1
  make || return 1
  install -D -m644 pysvn/__init__.py $pkgdir/usr/lib/python2.${_pyver}/site-packages/pysvn/__init__.py
  install -D -m755 pysvn/_pysvn_2_${_pyver}.so $pkgdir/usr/lib/python2.${_pyver}/site-packages/pysvn/_pysvn_2_${_pyver}.so
}

