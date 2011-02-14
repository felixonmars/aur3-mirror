# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=python-distpnd
pkgver=0.1
pkgrel=1
pkgdesc="distutils commands to create PND files for the Pandora handheld."
arch=('any')
url="https://github.com/Tempel/distPND"
license=('MIT')
depends=('python2')
makedepends=()
optdepends=('squashfs-tools: build standard compressed PNDs' 
            'cdrkit: build iso file PNDs')
provides=()
conflicts=('python-distpnd-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/Tempel/distPND/zipball/v0.1)
md5sums=('ced43ba5e2ada0a1696e28330e2842ca')

_zipballdir=Tempel-distPND-d270c38

package() {
  cd "$srcdir/$_zipballdir"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -D -m644 "$srcdir/$_zipballdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
