# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname=gedit-whitespace-terminator-git
pkgver=20110905
pkgrel=1
pkgdesc="Plugin for Gedit 3 that strips trailing whitespace on saving."
arch=('any')
url="https://github.com/Kozea/Gedit-WhiteSpace-Terminator"
license=('custom:BSD')
depends=('gedit>=3')
makedepends=('git')

_gitroot="git://github.com/Kozea/Gedit-WhiteSpace-Terminator.git"
_gitname="gedit-whitespace-terminator"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  install -d $pkgdir/usr/lib/gedit/plugins
  install -m644 whitespaceterminator.plugin whitespaceterminator.py $pkgdir/usr/lib/gedit/plugins

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
