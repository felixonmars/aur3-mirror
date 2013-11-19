# Maintainer: unknown32767 chenao960716 AT gmail DOT com
# modified from cl-hperspec
pkgname=hyperspec
pkgver=7.0
pkgrel=1
conflicts=('cl-hyperspec')
pkgdesc="Common Lisp ANSI-standard Hyperspec, Updated from cl-hyperspec"
arch=('i686' 'x86_64')
url="http://www.lispworks.com/reference/HyperSpec/"
license=('HyperSpec')
source=('ftp://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-7-0.tar.gz')
md5sums=('8df440c9f1614e2acfa5e9a360c8969a')

package()
{
	cd $srcdir/HyperSpec

	mkdir -p $pkgdir/usr/share/doc/HyperSpec
	cp -R ./* $pkgdir/usr/share/doc/HyperSpec
	cp -R ../HyperSpec-Legalese.text $pkgdir/usr/share/doc/HyperSpec
	cp -R ../HyperSpec-README.text $pkgdir/usr/share/doc/HyperSpec
}
