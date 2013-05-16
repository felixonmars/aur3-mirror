# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=mfdl-git
pkgver=0.32.a3dc6f1
pkgrel=1
pkgdesc='Download manga from mangafox.me'
url='https://github.com/techwizrd/MangaFox-Download-Script'
license=('custom')
arch=('any')
depends=('python2-beautifulsoup4')
makedepends=('git')

_gitname=mfdl
source=($_gitname::'git://github.com/techwizrd/MangaFox-Download-Script.git')
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  sed 's,#!/usr/bin/env python,#!/usr/bin/env python2,' -i mfdl.py
}

package() {
  install -Dm755 "$srcdir/$_gitname/mfdl.py" "$pkgdir/usr/bin/mfdl"
}
