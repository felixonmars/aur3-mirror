# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=squirrelmail-i18n
pkgver=1.5.1
_snapshot=20060409
pkgrel=4
pkgdesc="Webmail for Nuts! translation (all locale)"
arch=(any)
url="http://www.squirrelmail.org"
depends=('squirrelmail')
license=()
source=(http://downloads.sourceforge.net/sourceforge/squirrelmail/all_locales-${pkgver}-${_snapshot}.tar.gz)
md5sums=('32946a396a96c3e2c6619d07f66c2743')

build() {
  # install
  local dstdir=$pkgdir/srv/http/squirrelmail			|| return 1
  install -d $dstdir						|| return 1
  cd $dstdir							|| return 1
  cp -a -i $startdir/src/{help,images,locale} .			|| return 1
  rm -R ./help/en_US						|| return 1  
  chmod -R og+X .						|| return 1

  # remove CVS dirs
  # find $startdir/pkg -type d -name CVS -exec rm -rf {} \; || return 1
}
# vim: ts=2 sw=2 et ft=sh
