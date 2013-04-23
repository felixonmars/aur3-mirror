# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=python2-sqlitedict
_pkgname=sqlitedict
pkgver=1.0.9
pkgrel=1
pkgdesc="Persistent dict in Python, backed up by sqlite3 and pickle, multithread-safe"
arch=(i686 x86_64)
url="https://github.com/piskvorky/sqlitedict"
license=('Public domain')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('f2bb70ac43bc1b43c6703c8b876d86fe')
sha1sums=('d6349ab64738a4d83b65664f3f44db9dbd496de5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
