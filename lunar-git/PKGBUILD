# Contributor: Will Chappell <wtchappell@gmail.com>

pkgname=lunar-git
pkgver=20100910
pkgrel=1
pkgdesc="Black and orange awesome theme, based on zenburn."
arch=('i686' 'x86_64')
url="http://github.com/wtchappell/lunar/"
license=('GPL')
depends=('terminus-font' 'awesome')
makedepends=('git')

_gitroot="git://github.com/wtchappell/lunar.git"

build() {

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  mkdir -p $startdir/pkg/usr/share/awesome/themes/lunar
  cp -r . $startdir/pkg/usr/share/awesome/themes/lunar
}

# vim:set ts=2 sw=2 et:

