# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Maintainer: Essien Ita Essien <me@essienitaessien.com>
# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>

pkgname=omniorbpy-omg
pkgver=3.3
pkgrel=1
pkgdesc="omniORB is a CORBA object request broker for C++ and Python. It is very fast, robust, and standards-compliant."
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb>=4.1.0' 'omniorb<4.2.0')
makedepends=('python<3.0')
provides=('omniorbpy')
conflicts=('omniorbpy')
install=
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.gz)
md5sums=('5c6ab56e43a80e1d108e6821a6ff8027')

build() {
  cd $startdir/src/omniORBpy-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  _python_script_path=`python  -c "from distutils import sysconfig; print sysconfig.get_python_lib(0,0,prefix='/usr')"`
  # remove files provided by omniORB
  rm $startdir/pkg/$_python_script_path/omniidl_be/__init__.py*
}

