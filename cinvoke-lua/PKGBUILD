# Contributor: Dwight Schauer <dschauer@gmail.com>

pkgname=cinvoke-lua
_pkgname=cinvoke
_libname=cinvoke_lua.so
_libname64=cinvoke_lua64.so
_luaver=5.1
pkgver=1.03b
pkgrel=1
pkgdesc="Library for connecting Lua to C libraries at runtime"
arch=('i686' 'x86_64')
url="https://bitbucket.org/bogen/cinvoke"
license=('BSD')
makedepends=('perl')
depends=('lua')

source=(https://bitbucket.org/bogen/${_pkgname}/get/${pkgver}.tar.gz)

build() {
  cd $srcdir/cinvoke

  echo "building 32 bit integer lua binding"
  perl configure.pl --prefix=/usr || true
  make || return 1
  make -C bindings/lua || return 1
  install -D -m644 bindings/lua/${_libname} ${pkgdir}/usr/lib/lua/${_luaver}/${_libname} || return 1

  echo "cleaning between builds"
  make clean || return 1
  make -C bindings/lua clean || return 1

  echo "building 64 bit integer lua binding"
  export LNUM_INT64="TRUE"
  perl configure.pl --prefix=/usr || true
  make || return 1
  make -C bindings/lua || return 1
  install -D -m644 bindings/lua/${_libname} ${pkgdir}/usr/lib/lua/${_luaver}/${_libname64} || return 1
}

sha256sums=('48d9f471a4902c432b0d312926cc2e567bd84d7e657854e20b0bbbbd25bf7345')
