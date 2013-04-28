# $Id: PKGBUILD,v 1.10 2009/03/13 21:14:09 sergej Exp $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Maintainer: Sergej Pupykin <sergej@aur.archlinux.org>
# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-urwid-git
_gitname=urwid
pkgver=2013.01.27.g3672372
pkgrel=1
pkgdesc="Urwid is a curses-based user interface library."
license=('LGPL')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-distribute')
conflicts=('python-urwid')
provides=('python-urwid')
url="http://excess.org/urwid/"
source=('git://github.com/wardi/urwid.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
