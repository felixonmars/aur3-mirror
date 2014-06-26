# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=ttm_unpack_py-git
pkgver=16_2d77ad1
pkgrel=1
pkgdesc="Python-port of the ttm_unpack software for unpacking RPG Maker XP datafiles"
url="https://github.com/Kaira-/ttm_unpack_py/"
arch=('any')
license=('AS IS')
depends=('python2')
optdepends=()
makedepends=('qscintilla')
source=("git+https://github.com/BlackLotus/ttm_unpack_py")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ttm_unpack_py"
  echo "$(git rev-list --count HEAD)"_"$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/ttm_unpack_py"
  install -Dm755 ttm_unpack.py "$pkgdir/usr/bin/ttm_unpack.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-git//}/LICENSE"
}

# vim:set ts=2 sw=2 et:
