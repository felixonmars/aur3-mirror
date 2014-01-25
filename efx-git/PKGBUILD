# Maintainer: kuri <sysegv@gmail.com>

_pkgname=efx
pkgname=efx-git
pkgver=1.7.99.145.1473f95
pkgrel=1
pkgdesc="Effects library on top of evas (EFL)."
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl')
provides=('efx')
makedepends=('git')
source=("git://git.enlightenment.org/devs/discomfitor/efx.git")
sha256sums=('SKIP')

pkgver()
{
  cd $_pkgname

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build()
{
  cd $_pkgname

  ./autogen.sh --prefix=/usr --disable-tests
  make
}

package()
{
  cd $_pkgname
  make DESTDIR=$pkgdir install
}