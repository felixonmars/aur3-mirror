# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=image-usb-stick-git
pkgver=20111007
pkgrel=1
pkgdesc="Cross Platform USB key imaging tool"
arch=(any)
url="http://github.com/abock/image-usb-stick"
license=('custom')
groups=()
depends=(python2)
makedepends=('git')

_gitroot="http://github.com/abock/image-usb-stick"
_gitname=image-usb-stick

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  sed -i s'|#!/usr/bin/env python|#!/usr/bin/env python2|'g ${srcdir}/$_gitname/image-usb-stick	
}

package() {
  install -m755 -d "$pkgdir/usr/share/licenses/$_gitname"
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -d "$pkgdir/usr/share/$_gitname"

  cd "$srcdir/$_gitname"
  install -m755 image-usb-stick "$pkgdir/usr/bin/"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/$_gitname/"
  install -m644 README "$pkgdir/usr/share/$_gitname"
}

# vim:set ts=2 sw=2 et:
