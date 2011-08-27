# Maintainer: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>, Saeed Rasooli <saeed.gnu@gmail.com>

pkgname=pyglossary
pkgver=2010.10.03
_pkgfile="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A tool for working with dictionary databases"
arch=('any')
url="http://sourceforge.net/projects/pyglossary"
license=('GPL' 'LGPL')
groups=()
depends=(python2 pygtk libglade)
makedepends=()
optdepends=(dictzip python-pysqlite)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('12e608efc74b08aeae40692a49642bd1')

build() {
  tar xvfz $_pkgfile.tar.gz
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share"
  mkdir -p "$pkgdir/usr/share/pyglossary"
  for fname in src plugins lib doc ; do
      mv $_pkgfile/$fname "$pkgdir/usr/share/pyglossary"
  done
  mkdir -p "$pkgdir/usr/bin"
  echo "python2 /usr/share/pyglossary/src/pyglossary.pyw" > "$pkgdir/usr/bin/pyglossary"
  chmod a+x "$pkgdir/usr/bin/pyglossary"
  chown -R root:root "$pkgdir"
}
