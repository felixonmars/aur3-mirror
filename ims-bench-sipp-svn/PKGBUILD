# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=ims-bench-sipp-svn
pkgver=591
pkgrel=3
pkgdesc="Enhanced version of SIPp for IMS testing"
arch=('i686' 'x86_64')
url="http://sipp.sourceforge.net/ims_bench_sipp/"
license=('GPL')
depends=()
makedepends=('subversion' 'openssl' 'ncurses' 'gsl')
provides=('ims-bench-sipp')
conflicts=('ims-bench-sipp' 'sipp')
source=(g++_defs.patch)
md5sums=('307522e561563d90d614308b76d58e05')

_svntrunk=https://sipp.svn.sourceforge.net/svnroot/sipp/sipp/branches/ims_bench
_svnmod=ims_bench

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

  patch -p0 -i $srcdir/g++_defs.patch
  make
  install -D -m 0755 sipp $pkgdir/usr/bin/sipp
  install -D -m 0755 manager $pkgdir/usr/bin/manager
  install -D -m 0755 cpum $pkgdir/usr/bin/cpum

  install -d -m 0755 $pkgdir/usr/share/ims-bench-sipp
  install -d -m 0755 $pkgdir/usr/share/ims-bench-sipp/scen
  install -m 0644 scen/*.xml $pkgdir/usr/share/ims-bench-sipp/scen
  install -d -m 0755 $pkgdir/usr/share/ims-bench-sipp/scripts
  install -m 0644 scripts/* $pkgdir/usr/share/ims-bench-sipp/scripts

}
