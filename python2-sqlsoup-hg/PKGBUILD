# Maintainer: Francesco Marella <francesco.marella@anche.no>

pkgname=python2-sqlsoup-hg
_hgname=sqlsoup
pkgver=0.9.0.r11.5699328ce6d8
_pkgver=0.9.0
pkgrel=1
pkgdesc="A one step database access tool, built on the SQLAlchemy ORM."
arch=('any')
license=('MIT')
url="https://bitbucket.org/zzzeek/sqlsoup"
depends=('python2' 'python2-sqlalchemy')
makedepends=('mercurial')
source=("hg+https://bitbucket.org/zzzeek/sqlsoup")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_hgname"
    printf "%s.r%s.%s" "$_pkgver" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_hgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

}


