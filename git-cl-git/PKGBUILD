# Maintainer: Adrian Perez de Castro <adrian@perezdecastro.org>
# Contributor: Simon Klemenc (hiaselhans)
pkgname=git-cl-git
pkgver=7ae3194
pkgrel=1
pkgdesc="A git-command for integrating reviews on Rietveld"
arch=(any)
url="https://github.com/martine/git-cl"
license=('GPL')
depends=('git' 'python2')
makedepends=('git')
conflicts=('depot_tools-svn' 'depot-tools-git')
md5sums=('SKIP')
source=("$pkgname::git+https://github.com/martine/git-cl#branch=master~1")

scriptlet='#! /bin/sh
if [ "$PYTHONPATH" ] ; then
  PYTHONPATH="/usr/lib/git-cl:$PYTHONPATH"
else
  PYTHONPATH="/usr/lib/git-cl"
fi
export PYTHONPATH
exec python2 /usr/lib/git-cl/git-cl "$@"'

pkgver () {
  cd "$srcdir/$pkgname"
  git describe --always | sed 'y/-/./'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/git-cl"
  cp git-cl upload.py "$pkgdir/usr/lib/git-cl"
  chmod +x "$pkgdir/usr/lib/git-cl/git-cl"
  chmod -x "$pkgdir/usr/lib/git-cl/upload.py"
  mkdir -p "$pkgdir/usr/bin"
  echo "$scriptlet" > "$pkgdir/usr/bin/git-cl"
  chmod +x "$pkgdir/usr/bin/git-cl"
}
