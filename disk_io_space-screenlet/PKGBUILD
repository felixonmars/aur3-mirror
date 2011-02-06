# Contributor: twa022 <twa022@gmail.com>

pkgname=disk_io_space-screenlet
pkgver=0.7
pkgrel=2
pkgdesc="Show free space and disk I/O on multiple drives"
arch=('any')
url="http://gnome-look.org/content/show.php/Disk+Space+Screenlet?content=70718"
license=('GPL')
depends=('screenlets')
source=(http://gnome-look.org/CONTENT/content-files/112989-DiskIOSpace_v${pkgver}.tar.gz)

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  sed -i 's:/usr/bin/env python:&2:g' ${srcdir}/DiskIOSpace/*py
  cp -r $srcdir/DiskIOSpace $pkgdir/usr/share/screenlets/
}

md5sums=('04df636b8fe8920d1bf484b031aa1c1f')
