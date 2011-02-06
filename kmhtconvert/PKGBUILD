# $Id$
# Committer: Flemming Madsen <arch@themadsens.dk>
pkgname=kmhtconvert
pkgver=0.7.3
pkgrel=1
pkgdesc="An mht (Windows Web Archive) file to war (KDE Web Archive) file converter"
depends=('kdelibs' 'xorg')
source=('http://www.kde-apps.org/content/download.php?content=14315&id=1&X=/kmhtconvert.tgz')
url="http://users.otenet.gr/~geosp/kmhtconvert/index.html"
md5sums=('96f50b1fdadd0deb6fb4cd9607fd1b82')

build() {
 cd $startdir/src/$pkgname-$pkgver
 ./configure --prefix=/opt/kde
 make || return 1
 make DESTDIR=$startdir/pkg install || return 1
}
