# Contributor: Diejmon <diejmon at gmail _dot_com>
pkgname=cl-hyperspec
pkgver=7.0
pkgrel=1
pkgdesc="Common Lisp ANSI-standard Hyperspec"
arch=('i686' 'x86_64')
url="http://www.lispworks.com/reference/HyperSpec/"
license=('HyperSpec')
source=('ftp://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-7-0.tar.gz')
md5sums=('8df440c9f1614e2acfa5e9a360c8969a')

build() {
  cd $startdir/src/HyperSpec

  mkdir -p $startdir/pkg/usr/share/doc/HyperSpec
  cp -R ./* $startdir/pkg/usr/share/doc/HyperSpec
}


