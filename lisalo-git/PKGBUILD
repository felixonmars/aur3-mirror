# Maintainer: speps <speps at aur dot archlinux dot org>

_name=lisalo
pkgname=$_name-git
pkgver=2.0_git2b23605
pkgrel=1
pkgdesc="Linux Sampler Loader"
arch=(any)
url="http://www.$_name.org/"
license=('GPL3')
depends=('calfbox')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+https://github.com/nilsgey/Lisalo.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  echo `grep Version README | cut -d" " -f2`_git`git describe --always | sed 's|-|.|g'`
}

package() {
  cd "$srcdir/$_name"

  # data
  install -d "$pkgdir/usr/share/$_name"
  cp README example.lsl "$pkgdir/usr/share/$_name"

  # exec
  install -Dm755 $_name "$pkgdir/usr/bin/$_name"
}

# vim:set ts=2 sw=2 et:
