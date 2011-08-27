# $Id: PKGBUILD 14/01/2009 14:07:33  $
# Maintainer: Marco Rocco <ech0s7> <mr85mr@gmail.com>


pkgname=gedit-pkgbuild-highlight
pkgver=0.1.0
pkgrel=3
pkgdesc="PKGBUILD Colored HighLight support in gedit"
arch=(i686 x86_64)
license=('GPL')
url="http://www.ech0s7.netsons.org/"
depends=('gedit' 'shared-mime-info' 'gtksourceview2' )
install=gedit-pkgbuild-highlight.install
source=('pkgbuild.lang' 'pkgbuild.xml')
md5sums=('c7ac49e8250525d96571fa6b1944014b'
			'1ebd783f76c5ae95d9a34fc91b50fbdd')


build() {
  cd "${srcdir}/" || return 1
  mkdir -p $startdir/pkg/usr/share/mime/packages || return 1
  cp pkgbuild.xml $startdir/pkg/usr/share/mime/packages || return 1
  mkdir -p $startdir/pkg//usr/share/gtksourceview-2.0/language-specs || return 1
  cp pkgbuild.lang $startdir/pkg//usr/share/gtksourceview-2.0/language-specs/pkgbuild.lang || return 1

}
