# Maintainer: Glen Oakley <goakley123@gmail.com>

pkgname=twine
pkgrel=2
pkgver=1.4.2
pkgdesc="Twine is an open-source tool for telling interactive, nonlinear stories."
arch=(any)
url="http://twinery.org/"
license=('GPL')
groups=()
depends=('python2' 'wxpython')
makedepends=('unzip')
provides=()
conflicts=('twine-git')
replaces=()
backup=()
options=()
install=
noextract=()
source=(https://github.com/tweecode/twine/archive/v1.4.2.zip)
sha512sums=('d398207d6de5a44af1127277d9d76458447d0c9c4972a0543c51019e1456db742c129c260cbaa929ab0d5c9ab28522854aa88224f49540059383389c507fd68b')

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/twine"
  echo -e '#!/bin/bash\ncd /opt/twine && python2 app.py' > "$pkgdir/usr/bin/twine"
  chmod +x "$pkgdir/usr/bin/twine"
  ln -s "/opt/twine/twee" "$pkgdir/usr/bin/twee"
  cp "$srcdir/$pkgname-$pkgver/gpl.txt" "$pkgdir/usr/share/licenses/LICENSE"
}

# vim:set ts=2 sw=2 et:
