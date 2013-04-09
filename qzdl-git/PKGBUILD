# Maintainer: OrdinaryMagician <saniukeokusainaya@gmail.com>
pkgname=qzdl-git
pkgver=20130409
pkgrel=1
pkgdesc="A ZDoom launcher using Qt (Development branch)"
arch=('x86_64' 'i686')
url="http://zdl.vectec.net"
license=('GPL')
depends=('qt4')
conflicts=('qzdl')
makedepends=('git' 'gdb' 'make')
source=("git://github.com/qbasicer/qzdl.git")
md5sums=("SKIP")
_gitname="qzdl"

pkgver()
{
  date -u +%Y%m%d
}

build()
{
  cd "${srcdir}/${_gitname}"
  rm -rf "${srcdir}/${_gitname}-build"
  mkdir "${srcdir}/${_gitname}-build"
  ls -A | grep -v .git | xargs -d '\n' cp -r -t ../${_gitname}-build
  cd "${srcdir}/${_gitname}-build"
  # little fixup for the latest qt4 update
  # should be necessary until qbasicer actually updates the project
  # (last commit was around September 2012)
  sed -si 's/qmake/qmake-qt4/g' configure configure.in
  ./configure \
      --prefix=/usr \
      --disable-updater
  make
}

package()
{
  cd "${srcdir}/${_gitname}-build"
  mkdir -p "${pkgdir}/usr/bin"
  mv "zdl" "${pkgdir}/usr/bin"
}
