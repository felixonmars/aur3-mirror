# Maintainer: Moritz Kiefer <moritz.kiefer@gmail.com>

pkgname=lmms-lv2-git
pkgver=20130320
pkgrel=1
pkgdesc="Port of the LMMS plugins to LV2"
arch=('i686' 'x86_64')
url="https://github.com/pgiblox/lmms-lv2"
license="Unkown"
provides="lmms-lv2"
depends=('gtk2' 'lv2')
makedepends=('')

_gitroot="git://github.com/pgiblox/lmms-lv2.git"
_gitname="lmmvs-lv2"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname

  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir=$pkgdir
}
