# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=xqde-themes
pkgver=20071117
pkgrel=2
pkgdesc="Resources for XQDE dock"
url="http://xqde.xiaprojects.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xqde')
source=(http://xqde.xiaprojects.com/downloads/Resources//resources.default-${pkgver}.tar.bz2)
md5sums=('9ae5e311d622cff5d90825efeb2eb23d')

build() {
  mkdir -p $startdir/pkg/usr/share/xqde/
  cd $startdir/src/
  cp -r * $startdir/pkg/usr/share/xqde/
}
