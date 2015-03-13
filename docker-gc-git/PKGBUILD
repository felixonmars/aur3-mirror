# Maintainer: Clément DEMOULINS <clement@archivel.fr>
pkgname=docker-gc-git
_realname=docker-gc
pkgver=20150217
pkgrel=1
pkgdesc="A simple docker container and image garbage collection script."
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
depends=('docker' 'python' 'procps-ng')
makedepends=('git')

source=(git+https://github.com/spotify/docker-gc.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd "$srcdir/${_realname}"
  install -D -m755 docker-gc "$pkgdir/usr/bin/docker-gc"
}

# vim:set ts=2 sw=2 et:
