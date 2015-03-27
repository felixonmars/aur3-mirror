# Maintainer: Benjamin Oldenburg <benjamin.oldenburg@gmail.com>

pkgname=omniorbpy-svn
pkgver=6283
pkgrel=1
pkgdesc="omniORB is a CORBA object request broker for C++ and Python."
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb-svn' 'openssl' 'python>=3.4')
conflicts=('omniorbpy-omg' 'pyorbit')
source=(svn://svn.code.sf.net/p/omniorb/svn/trunk/omniORBpy)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/omniORBpy"
  svnversion | tr -d [A-z]
}
 
build() {
  cd "${srcdir}/omniORBpy"
  ./configure --with-omniorb=/usr --with-openssl=/usr PYTHON=/usr/bin/python --prefix=/usr
  make $MAKEFLAGS
}
 
package() {
  cd "$srcdir/omniORBpy"
  make DESTDIR="$pkgdir" install
 
  # remove conflicting files
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.py*
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__pycache__ -Rf
 
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' \;
  chmod 775 "$pkgdir"/{usr/include/omniORB4/,usr/lib/python3.4/site-packages/omniidl_be/}
 
}

