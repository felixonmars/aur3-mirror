# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=libui-sh-git
pkgver=2010.04.04
pkgrel=1
pkgdesc="a shell library providing useful UI functions"
arch=('any')
url="http://github.com/Dieterbe/libui-sh/"
license=('GPL3')
depends=('bash')
optdepends=('dialog: for ncurses support')
source=()
md5sums=()
makedepends=('git')
provides=('libui-sh')
conflicts=('libui-sh')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/libui-sh.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
