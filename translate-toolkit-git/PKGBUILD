# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=translate-toolkit-git
pkgver=1.10.0.152.gd3f8354
pkgrel=1
# Not using epoch; last manually set version was 20120923
pkgdesc='A toolkit to convert between various different translation formats, help process and validate localisations. Development version.'
arch=('any')
url='http://translate.sourceforge.net/wiki/toolkit/index'
license=('GPL')
depends=('python2' 'python2-lxml')
optdepends=('python2-iniparse: to use ini2po script')
makedepends=('git')
provides=('translate-toolkit')
conflicts=('translate-toolkit')
replaces=('translate-toolkit')
source=("$pkgname::git://github.com/translate/translate.git")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's@-@.@g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find . -name '*.py')
}

package() {
  cd "$srcdir/$pkgname"
  msg "Running setup.py install..."
  python2 setup.py --quiet install --root="$pkgdir" --optimize=1
}

md5sums=('SKIP')
sha256sums=('SKIP')
