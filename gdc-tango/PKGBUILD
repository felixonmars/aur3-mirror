# Contributor: Jerome Berger <jeberger@free.fr>
pkgname=gdc-tango
pkgver=0.99.7
pkgrel=1
pkgdesc="Runtime library for the D programming language (gdc version)"
arch=(i686 x86_64)
url="http://www.dsource.org/projects/tango/"
license=('custom')
depends=('gdc-svn>=214')
options=('!libtool' '!emptydirs')
install=
source=("http://downloads.dsource.org/projects/tango/$pkgver/tango-$pkgver-src.tar.gz")
md5sums=('531233e7bc7838648b610e34e5616911')

build() {
  cd "$srcdir/tango-$pkgver-src/lib"

  export MAKEFLAGS="-j1"
  ./build-gdc.sh || (echo "build-gdc failed" && return 1) || return 1
  ./build-tango.sh gdc || (echo "build-tango failed" && return 1) || return 1

  _gdcversion=$(gdc -dumpversion)
  install -Dm 755 libgphobos.a ${startdir}/pkg/usr/lib/libgphobos.a.tango || return 1
  install -Dm 755 libgtango.a ${startdir}/pkg/usr/lib || return 1
  install -Dm 644 ../object.di ${startdir}/pkg/usr/include/d/$_gdcversion/object.di.tango || return 1
  cp -a ../tango ${startdir}/pkg/usr/include/d/$_gdcversion || return 1
  cp -a ../std ${startdir}/pkg/usr/include/d/$_gdcversion/std.tango || return 1
}

# vim:set ts=2 sw=2 et:
