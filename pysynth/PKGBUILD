# Maintainer: spep <speps at aur dot archlinux dot org>

_name=PySynth
pkgname=pysynth
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple music synthesizer written in Python."
arch=(any)
url="http://home.arcor.de/mdoege/pysynth/"
license=('GPL')
depends=('python2-numpy')
source=("$url$_name-$pkgver.tar.gz")
md5sums=('a2fb5ebcc04b85630c873cc9aae23b47')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir"

  # python2 fix
  sed -i "s/env python$/&2/" `grep -rl "env python" "$pkgdir"`
}

# vim:set ts=2 sw=2 et:
