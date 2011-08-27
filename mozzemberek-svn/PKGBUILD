# Contributor: Samed Beyribey <ras0ir at eventualis dot org>
pkgname=mozzemberek-svn
pkgver=436
pkgrel=1
pkgdesc="MozZemberek is an extension which provides Turkish spell checking using Zemberek server installed on the same computer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/zemberek"
license=('GPL')
depends=('firefox' 'zemberek-server')
makedepends=('xulrunner' 'subversion')
provides=("mozzemberek='0.1.3'")
install=(mozzemberek.install)
_svntrunk=http://zemberek.googlecode.com/svn/trunk/mozzemberek
_svnmod=mozzemberek

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # Let's Rock
  #
 make DESTDIR="$pkgdir/" MOZILLA_FIVE_HOME="/usr/lib/firefox-3.6" install-unpacked
}
