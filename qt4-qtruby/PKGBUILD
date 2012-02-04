# Contributor: Rei <chloerei@gmail.com>
pkgname=qt4-qtruby
pkgver=2.1.0
pkgrel=1
pkgdesc="Ruby bindings for the Qt4 toolkit."
arch=('i686' 'x86_64')
url="http://rubyforge.org/projects/korundum/"
license=('LGPL')
depends=('ruby' 'qt')
makedepends=('cmake')
provides=('qtruby')
conflicts=('kdebindings-smoke' 'kdebindings-ruby')
source=(http://rubyforge.org/frs/download.php/71843/$pkgname-$pkgver.tar.gz)
md5sums=('b1720fd928a6de35b543c6e83d5f1fe0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find ./ruby -name CMakeLists.txt \
    -exec sed -i "s|\${RUBY_INCLUDE_PATH}|\${RUBY_INCLUDE_PATH} /usr/include/ruby-1.9.1/${CARCH}-linux|" {} \;

  test -r Makefile && make clean
  rm -f CMakeCache.txt CMakeFiles/*log
  cmake \
    -DENABLE_QTTEST=off \
    -DENABLE_QTTEST_SMOKE=off \
    -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR="$pkgdir/" install
}

