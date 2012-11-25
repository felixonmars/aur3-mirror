# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=unity-scope-video-remote
pkgver=0.3.10
pkgrel=1
pkgdesc="Videos Lens scope for online sources"
arch=('any')
url="https://launchpad.net/unity-scope-video-remote"
license=('GPL')
depends=('unity-lens-video' 'libsoup-gnome')
makedepends=('python2-distutils-extra')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('de4ab7e4c7b5aa8ac15f7665e43ae4a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/unity-scope-video-remote

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
