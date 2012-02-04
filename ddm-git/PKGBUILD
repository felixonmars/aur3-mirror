# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=ddm-git
pkgver=20100904
pkgrel=2
pkgdesc="DDM (Distributed Data Manager), manages your data"
arch=('any')
url="http://github.com/Dieterbe/ddm"
license=('GPL3')
depends=('rsync')
optdepends=('dmenu: for ddm-wizard')
makedepends=('git')
provides=('ddm')
conflicts=('ddm')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/ddm.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
