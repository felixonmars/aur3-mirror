# Maintainer: spider-mario <spidermario@free.fr>
pkgname=jbig2enc-pdf-git
pkgver=20110922
pkgrel=1
pkgdesc="pdf.py from jbig2enc"
arch=('any')
url="https://github.com/agl/jbig2enc"
license=('unknown')
depends=('python2')

_gitroot="https://github.com/agl/jbig2enc.git"
_gitname="jbig2enc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  install --directory "$pkgdir"/usr/bin/
  sed --expression 's#/usr/bin/python#/usr/bin/env python2#' pdf.py > "$pkgdir"/usr/bin/pdf.py
  chmod +x "$pkgdir"/usr/bin/pdf.py
}

# vim:set ts=2 sw=2 et:
