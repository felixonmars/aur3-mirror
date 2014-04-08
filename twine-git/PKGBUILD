# Maintainer: Glen Oakley <goakley123@gmail.com>

pkgname=twine-git
pkgrel=1
pkgver=7ac76b9
pkgdesc="Twine is an open-source tool for telling interactive, nonlinear stories."
arch=(any)
url="http://twinery.org/"
license=('GPL')
groups=()
depends=('python2' 'wxpython')
makedepends=('git')
provides=('twine')
conflicts=('twine')
replaces=()
backup=()
options=()
install=
noextract=()
source=("$pkgname"::'git://github.com/tweecode/twine.git')
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt/twine-git"
  rm -rf "$pkgdir/opt/twine-git/.git"
  echo -e '#!/bin/bash\ncd /opt/twine && python2 app.py' > "$pkgdir/usr/bin/twine-git"
  chmod +x "$pkgdir/usr/bin/twine-git"
  echo -e '#!/bin/bash\ncd /opt/twine && python2 twee' > "$pkgdir/usr/bin/twee"
  chmod +x "$pkgdir/usr/bin/twee"
  cp "$srcdir/$pkgname/gpl.txt" "$pkgdir/usr/share/licenses/LICENSE"
}

# vim:set ts=2 sw=2 et:
