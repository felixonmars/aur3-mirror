# Maintainer: Ramana Kumar <ramana.kumar@gmail.com>
# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=gitview
pkgver=0.7
pkgrel=1
pkgdesc='A GTK based repository browser for git'
arch=('i686' 'x86_64')
url='http://gitview.sourceforge.net'
license=('GPL')
depends=(git pygtk pygtksourceview2)
source=(https://downloads.sourceforge.net/project/gitview/gitview/gitview-0.7/gitview-0.7.tar)
md5sums=('2e71abc7ade9dd889ebe894b1d50613c')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/gitview
	cd gitview
	sed -i '/\/usr\/bin\/env/s/python/python2/' gitview
  install -m 755 gitview $pkgdir/usr/bin/gitview
  install -m 644 gitview.txt $pkgdir/usr/share/doc/gitview/gitview.txt
}
