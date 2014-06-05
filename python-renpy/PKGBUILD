# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor: zhn <zhangn1985 AT gmail com>
pkgname=python-renpy
pkgver=6.17.6
pkgrel=1
pkgdesc="Platform-dependant Ren'Py libraries."
arch=('i686' 'x86_64')
license=('MIT')
url='http://www.renpy.org'
depends=('fribidi' 'glew' 'ffmpeg' 'python2-pygame>=1.9.1' 'freetype2>=2.5.1')
conflicts=("renpy<$pkgver" 'renpy64' 'renpy-bin')
# python-argparse is part of distribution since 2.7
makedepends=('python2>=2.7' 'cython')
source=("http://www.renpy.org/dl/$pkgver/renpy-${pkgver}-source.tar.bz2")

md5sums=('ca600e9b346b9bd200844234eaf49049')

export CPPFLAGS="$CPPFLAGS -Os $(pkg-config freetype2 --cflags) $(pkg-config glib-2.0 --cflags)"

build() {
  cd "$srcdir"/renpy-${pkgver}-source

  python2 module/setup.py build
}

package(){
  cd "$srcdir"/renpy-${pkgver}-source

  # install python-renpy
  python2 module/setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -D -m644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
