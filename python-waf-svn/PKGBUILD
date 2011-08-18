# Maintainer: Sebastien Binet <binet@cern.ch>

pkgname=python-waf-svn
pkgver=11519
pkgrel=1
pkgdesc="A general-purpose build system modelled after Scons."
url="http://code.google.com/p/waf"
arch=("i686" "x86_64")
makedepends=('subversion')
license=("BSD")
depends=("python")
conflicts=('python-waf')
provides=('python-waf')
source=(LICENSE)
md5sums=('d7a7db36b2ed6a80f887e9bf693b0a01')

_svntrunk=http://waf.googlecode.com/svn/trunk/
_svnmod=$pkgname

build() {

  cd $startdir/src
  /bin/rm -rf ${_svnmod}
  msg "fetching sources from SVN..."
  svn co ${_svntrunk} -r ${pkgver} ${_svnmod} || return 1

  cd $startdir/src/$pkgname
  python ./waf-light configure --prefix=/usr
  python ./waf-light --make-waf

  waf_tools='batched_cc,compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8'
  yes | python ./waf-light install -f --destdir=$pkgdir --tools=${waf_tools}
}

package() {
  install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m755 $startdir/src/$pkgname/waf $pkgdir/usr/bin/waf

  # Force the generation of .waf.admin files
  cd $srcdir/$pkgname/demos/c
  $pkgdir/usr/bin/waf configure build  >& /dev/null

  # Set the right permissions
  chmod -R 0644 $pkgdir/usr/bin/.waf*/waflib/Tools/*
  chown -R root:root $pkgdir/usr/*
}
