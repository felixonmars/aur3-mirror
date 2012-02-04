# Maintainer: Hannes Riehl <hannes.riehl at gmail dot com>

pkgname=magicons
_pkgname=MagIcons
pkgver=0.3_0
_pkgver=0-3-0
pkgrel=1
pkgdesc="A small application to manipulate iconsets for GNOME."
arch=('any')
url="http://magicons.bplaced.net/"
license=('GPL')
groups=('gnome')
depends=('python-imaging' 'gnome-python')
source=("http://magicons.bplaced.net/"$_pkgname"_Source_"$_pkgver".tar.gz")
md5sums=('d7674120db2a6280e5ad6114c80cdbd9')

build() {
  cd $srcdir/$_pkgname'_Source/'$_pkgname
  cp -r * $pkgdir
}

