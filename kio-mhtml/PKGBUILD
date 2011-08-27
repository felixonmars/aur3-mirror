# $Id$
# Committer: Flemming Madsen <arch@themadsens.dk>
pkgname=kio-mhtml
pkgver=0.3.4
pkgrel=1
pkgdesc="An mht (Windows Web Archive) kio plugin"
depends=('kdelibs' 'xorg')
source=('http://www.kde-apps.org/content/download.php?content=14315&id=2X=/kio_mhtml.tgz')
url="http://users.otenet.gr/~geosp/kmhtconvert/index.html"
md5sums=('ac658b9480c1e82db844639114e0e62a')

build() {
 cd $startdir/src/kio_mhtml-$pkgver
 ./configure --prefix=/opt/kde
 make || return 1
 make DESTDIR=$startdir/pkg install || return 1
}
