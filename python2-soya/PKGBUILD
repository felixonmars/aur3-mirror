# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: David 'wornaki' Lemma <wornaki@gmail.com>
# Contributor: mar77i <mysatyre at gmail dot com>
pkgname=python2-soya
_pkgname=soya
pkgver=0.15rc1
pkgrel=7
pkgdesc="A very high level 3D engine for Python"
url="http://home.gna.org/oomadness/en/soya"
arch=('i686' 'x86_64')
license="GPL"
depends=('pyrex' 'freetype2' 'sdl' 'cal3d' 'glew' 'editobj' 'ode-sp' 'openal' 'python2-pillow')
source=("http://download.gna.org/$_pkgname/${_pkgname^}-$pkgver.tar.bz2"
  "fix-freetype-2.5.1.patch")
md5sums=('37c8db4e3003b3e65032f980ee29c36c'
         '21fc864bfd79b7d5becd8ad9dcce6482')
sha1sums=('535bb45ded025ae436203120a5fef9a3df33320d'
          '1b8e9aafdfc132c51bd647f54083f74b60d840cc')
sha256sums=('2567714bc312a171bb5b31cb854804a78cff878e8d5cd2352cf37f48c8eb6dd6'
            'bb28522fabcdb5fd83cc5f1861123e7f4cfc8ac751da800657d7dc4f19f9d192')

build() {
  # pyrex tries to package by directory name (failing on dots)...
  [[ -d "$srcdir/$_pkgname" ]] && rm -r "$srcdir/$_pkgname"
  [[ -d "$srcdir/${_pkgname^}-$pkgver" ]] && mv -Tu "$srcdir/${_pkgname^}-$pkgver" "$srcdir/$_pkgname"
  cd "$srcdir/$_pkgname"
  # See https://bugs.launchpad.net/inkscape/+bug/1255830
  patch -Np1 < ../fix-freetype-2.5.1.patch
  sed -i 's|/usr/local/include/cal3d|/usr/include/AL|' setup.py
  sed -i 's|LIBS = \["m", "GLEW", "SDL", "freetype", "cal3d", "stdc++","ode"\]|LIBS = \["m", "GLEW", "GLU", "SDL", "freetype", "cal3d", "stdc++","ode", "openal", "GL"\]|' setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir"
}
