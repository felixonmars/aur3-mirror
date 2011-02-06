# Contributor: David 'wornaki' Lemma <wornaki@gmail.com>
# Maintainer: Martti Kühne <mysatyre@gmail.com>

pkgname=soya
pkgver=0.15rc1
pkgrel=4
pkgdesc="A very high level 3D engine for Python"
url="http://home.gna.org/oomadness/en/soya"
arch=('i686' 'x86_64')
license="GPL"
depends=('pyrex' 'pil' 'freetype2' 'sdl' 'cal3d' 'glew' 'editobj' 'ode' 'openal')
source=(http://download.gna.org/$pkgname/${pkgname^}-$pkgver.tar.bz2)
md5sums=('37c8db4e3003b3e65032f980ee29c36c')

build() {
  # pyrex tries to package by directory name (failing on dots)...
  [[ -d "$srcdir/$pkgname" ]] && rm -r "$srcdir/$pkgname"
  [[ -d "$srcdir/${pkgname^}-$pkgver" ]] && mv -Tu "$srcdir/${pkgname^}-$pkgver" "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
#  cd "$srcdir/${pkgname^}-$pkgver"
  sed -i 's|/usr/local/include/cal3d|/usr/include/AL|' setup.py
  sed -i 's|LIBS = \["m", "GLEW", "SDL", "freetype", "cal3d", "stdc++","ode"\]|LIBS = \["m", "GLEW", "SDL", "freetype", "cal3d", "stdc++","ode", "openal", "GL"\]|' setup.py
  python2 setup.py install --root=$pkgdir
} 
