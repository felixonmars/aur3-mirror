# $Id: PKGBUILD 49034 2011-06-09 21:26:14Z andrea $
# Maintainer: Peter Feuerer <peter@piie.net>
# Maintainer of original libfm pkg: Angel Velasquez <angvp@archlinux.org>
# Maintainer of original libfm pkg: Juergen Hoetzel <juergen@archlinux.org>

pkgname=libfm_with_external_thumbnailers
conflicts=libfm
name=libfm
pkgver=0.1.17
provides="$name=$pkgver"
pkgrel=1
pkgdesc="the core of next generation file manager PCManFM with external thumbnailers for video, pdf and epub"
url="http://pcmanfm.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
groups=('lxde')
options=('!libtool')
install=libfm.install
depends=('gtk2' 'menu-cache' 'shared-mime-info' 'udisks' 'ffmpegthumbnailer' 'imagemagick' 'poppler' 'unzip')
source=(http://downloads.sourceforge.net/pcmanfm/$name-$pkgver.tar.gz
'0001-external-thumbnailers-thumbnails-for-big-files.patch::https://sourceforge.net/tracker/download.php?group_id=156956&atid=801866&file_id=426165&aid=3424000')
md5sums=('a97e03d973e6ac727f28d0934d6c9ad5'
         'a747371c5709da57d4389c0446285270')

build() {
  cd $srcdir/$name-$pkgver
  patch -p1 < $srcdir/0001-external-thumbnailers-thumbnails-for-big-files.patch
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-udisks \
    --with-gnu-ld 
  make 
}

package() {
  cd $srcdir/$name-$pkgver
  make DESTDIR=$pkgdir install
}
