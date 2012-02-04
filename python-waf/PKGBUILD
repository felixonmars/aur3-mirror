# Maintainer: Sebastien Binet <binet@cern.ch>

pkgname=python-waf
pkgver=1.6.8
pkgrel=1
pkgdesc="A general-purpose build system modelled after Scons."
url="http://code.google.com/p/waf"
arch=("i686" "x86_64")
license=("BSD")
depends=("python")
source=(http://waf.googlecode.com/files/waf-${pkgver}.tar.bz2
        LICENSE)
md5sums=('ecaecbae140638920d1d09e5a97a10ce'
         'd7a7db36b2ed6a80f887e9bf693b0a01')

build() {

  cd $startdir/src/waf-$pkgver
  python ./waf-light configure --prefix=/usr
  python ./waf-light --make-waf

  waf_tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8'
  yes | python ./waf-light install -f --destdir=$pkgdir --tools=${waf_tools}
}

package() {
  install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m755 $startdir/src/waf-$pkgver/waf $pkgdir/usr/bin/waf

  # Force the generation of .waf.admin files
  cd $srcdir/waf-$pkgver/demos/c
  $pkgdir/usr/bin/waf configure build  >& /dev/null

  # Set the right permissions
  chmod -R 0644 $pkgdir/usr/bin/.waf*/waflib/Tools/*
  chown -R root:root $pkgdir/usr/*
}
