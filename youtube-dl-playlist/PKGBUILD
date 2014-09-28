# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contibutor: Robert Orzanna <orschiro@gmail.com>

pkgname=youtube-dl-playlist
pkgver=bd98b82
pkgrel=2
pkgdesc="Download videos from Youtube by playlist."
arch=('any')
url="https://github.com/jordoncm/youtube-dl-playlist"
license=('LGPL')
depends=('python2' 'youtube-dl')
makedepends=('git')
_gitroot="https://github.com/jordoncm/youtube-dl-playlist.git"
_gitname="youtube-dl-playlist"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' $pkgname
  install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
