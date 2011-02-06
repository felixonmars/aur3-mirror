# Contributor: Nathan Owe. <ndowens04 at gmail dot com>
pkgname=kumblr
pkgver=0.1
pkgrel=1
pkgdesc="Tumblr for KDE"
arch=('i686')
url="http://kde-apps.org/content/show.php/Kumblr?content=80591"
license=('GPL3')
depends=('python')
source=(http://kde-apps.org/CONTENT/content-files/80591-kumblr-0.1.zip 'kumblr.sh')
md5sums=('5c5fdaaf26c43f33830632e83a6aaa00' \
         'ac299eff38342a4ec861f6912364595c') 

build() {
  cd $srcdir/Kumblr
install -d $pkgdir/usr/{bin,share/$pkgname}
install  *.py *.qrc *.png $pkgdir/usr/share/$pkgname
install -m755 $srcdir/kumblr.sh $pkgdir/usr/bin/kumblr
  
}

# vim:set ts=2 sw=2 et:
