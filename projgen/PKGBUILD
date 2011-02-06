# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=projgen
pkgver=0.1.4
pkgrel=2
pkgdesc="Linux project generator tool for autogen-based C/C++/Python"
arch=('i686' 'x86_64')
url="http://moblin.org/"
license=('LGPL')
depends=('python' 'gconf' 'libglade' 'file' 'hicolor-icon-theme' 'file')
makedepends=()
options=('!libtool')
install=projgen.install
source=("http://moblin.org/sites/all/files/${pkgname}-${pkgver}.tgz"
    "fix_install.diff")

build() {
  cd $srcdir/${pkgname}
  patch -p1 < ../fix_install.diff || return 1
  sh autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
md5sums=('c3e69bbe17a470fd966c377c9a184f28'
         'c173700d447a1fd4716a142277bdf63e')
md5sums=('c3e69bbe17a470fd966c377c9a184f28'
         'c173700d447a1fd4716a142277bdf63e')
