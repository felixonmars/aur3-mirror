# Maintainer: Sergey Balabanov <sergey dot balabanov at gmail dot com>
pkgname=outwiker-git
pkgver=20141012
pkgrel=1
pkgdesc="Outliner and personal wiki"
arch=('any')
url="http://jenyay.net/Soft/Outwiker"
license=('GPL3')
groups=()
depends=('python2' 'wxpython2.8' 'pywebkitgtk' 'python2-pillow')
optdepends=('mimetex: rendering of formulas'
            'python-gnomeprint: printing non-latin symbols')
makedepends=('git' 'sed')
provides=()
conflicts=('outwiker' 'outwiker-bzr')
install=outwiker.install

_gitroot=https://github.com/Jenyay/outwiker.git
_gitname=outwiker.git

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
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  sed -i "s/python/python2/g" "$pkgdir/usr/bin/outwiker"
  sed -i -e "s|#!/usr/bin/env python|#!/usr/bin/env python2|g" "$pkgdir/usr/share/outwiker/runoutwiker.py"
}

# vim:set ts=2 sw=2 et:
