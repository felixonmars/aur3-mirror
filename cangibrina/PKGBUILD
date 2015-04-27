# This file is part of BlackArch Linux ( http://blackarch.org ).
# I am not the owner, but will keep this up to date
# See COPYING for license details.

# Maintainer: Fnkoc <franco.c.colombino@gmail.com>

pkgname='cangibrina'
pkgver=0.8.5
pkgrel=1
groups=('network')
pkgdesc='Fast and powerfull Dashboard (admin) Finder.'
arch=('any')
url='https://github.com/fnk0c/cangibrina'
license=('GPL2')
depends=('python2' 'python2-mechanize' 'python2-socks' 'python2-beautifulsoup4')
makedepends=('git')
source=('git+https://github.com/fnk0c/cangibrina.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/cangibrina"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/cangibrina"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cangibrina"

  install -Dm644 README.md "$pkgdir/usr/share/doc/cangibrina/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cangibrina/LICENSE"

  rm README.md LICENSE

  cp -a * "$pkgdir/usr/share/cangibrina"

  cat > "$pkgdir/usr/bin/cangibrina" << EOF
#!/bin/sh
cd /usr/share/cangibrina
exec python2 cangibrina.py "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/cangibrina"
}
