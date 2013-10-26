# Maintainer: Kazuo Teramoto <kaz.rag@gmail.com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
pkgname=alot-git
pkgver=0.3.5.20.g7ffe0bf
pkgrel=1
epoch=1
pkgdesc="A terminal interface for notmuch"
arch=('any')
url="https://github.com/pazz/alot"
license=('GPL')
depends=('notmuch' 'python2-pygpgme' 'python-magic' 'python2' 'python2-configobj' \
            'python2-urwid' 'twisted')
makedepends=('git')
provides=('alot')
conflicts=('alot')
source=('git://github.com/pazz/alot.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/alot"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/alot"
  python2 setup.py build
}

package() {
  cd "$srcdir/alot"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
