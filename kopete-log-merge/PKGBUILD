# Contributor: Uli Armbruster <uli.armbruster@googlemail.com>
pkgname=kopete-log-merge
pkgver=0.0.1
pkgrel=1
pkgdesc="KopeteLogMerge provides a script, klm, for merging Kopete log directories and files from one location with those from another"
url="http://www.kde-apps.org/content/show.php/KopeteLogMerge?content=84589"
license=("GPL")
source=(http://www.kde-apps.org/CONTENT/content-files/84589-KopeteLogMerge.tar.gz)
md5sums=('9ae79bed33a543ab96f029fc6e5b888c')
arch=('i686')

build() {
  cd $startdir/src/KopeteLogMerge
  install -D -m755 klm $startdir/pkg/usr/bin/klm
  mkdir -p $startdir/pkg/usr/share/man/man1
  cp $startdir/src/KopeteLogMerge/klm.1 $startdir/pkg/usr/share/man/man1/klm.1
}