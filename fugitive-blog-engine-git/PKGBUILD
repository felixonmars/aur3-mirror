# Maintainer: carstene1ns <arch carsten-teibes de>

_pkgbase=fugitive
pkgname=$_pkgbase-blog-engine-git
pkgver=125.53d0754
pkgrel=1
pkgdesc="Static blog engine running on top of git"
arch=('i686' 'x86_64')
url="https://gitorious.org/fugitive"
license=('GPL')
depends=('git')
source=("$_pkgbase::git://gitorious.org/fugitive/fugitive.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase

  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgbase

  ./build.sh
}

package() {
  cd $_pkgbase

  # install executable
  install -Dm755 $_pkgbase "$pkgdir/usr/bin/$_pkgbase"
}
