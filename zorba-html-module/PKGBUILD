# Author: Alexey Stukalov <astukalov@gmail.com>
pkgname=zorba-html-module
pkgver=3.0
pkgrel=1
pkgdesc="Zorba NoSQL query processor HTML module."
url="http://www.zorba.io/documentation/3.0/modules/www.zorba-xquery.com_modules_converters_html.html"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('zorba>=3.0')
makedepends=('zorba>=3.0' 'cmake>=2.8.0')

source=(http://launchpad.net/zorba/trunk/3.0/+download/zorba_modules-$pkgver.tar.gz)
md5sums=('b8b42fa41378dd6cdf57b7d851b5ed87')

prepare() {
  cd $srcdir

  mkdir build
}

build() {
  msg "Building..."
  cd $srcdir/build

  msg2 Configuring...
  cmake -Wno-dev \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -std=gnu++11 -Wno-c++0x-compat" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        $srcdir/zorba_modules/html

  msg2 Compiling...
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}

