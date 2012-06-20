# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=grabyahoogroup-svn
pkgver=125
pkgrel=1
pkgdesc="Yahoo! Group archiver"
arch=(any)
url="http://grabyahoogroup.sourceforge.net"
license=('GPL')
depends=('perl' 'perl-crypt-ssleay' 'perl-libwww' 'perl-html-parser' 'perl-term-readkey')
makedepends=('subversion')

_svntrunk=https://grabyahoogroup.svn.sourceforge.net/svnroot/grabyahoogroup
_svnmod=grabyahoogroup

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
}

package() {
  cd "$srcdir/$_svnmod-build/trunk/yahoo_group"
  install -D -m755 grabyahoogroup.pl "$pkgdir/usr/bin/grabyahoogroup.pl"
  install -D -m755 mboxify.pl "$pkgdir/usr/bin/mboxify.pl"
}
