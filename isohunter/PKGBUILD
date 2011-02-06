# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=isohunter
pkgver=1.1
pkgrel=1
pkgdesc="A PyQt4 application used for searching and downloading torrents"
arch=(any)
url="http://code.google.com/p/isohunter/"
source=("http://isohunter.googlecode.com/files/isoHunter-1.0.tar.bz2" "isohunter.sh")
license=('GPL3')
md5sums=('72fbbdde57c74802ac9e1f92b9624c26'
         '2dc6207ee77a556c8b0ed5272733fc4e')
depends=('python' 'pyqt')
options=(!emptydirs)

build() {
  
 install -d $pkgdir/usr/share/$pkgname $pkgdir/usr/bin
 install -m644 IH.png readme.txt serp_icon_bubble.gif serp_icon_star.gif coards.py $pkgdir/usr/share/$pkgname
 install -m755 $srcdir/isoHunter.py $pkgdir/usr/share/$pkgname
 install -m755 $srcdir/isohunter.sh $pkgdir/usr/bin/isohunter
  }


