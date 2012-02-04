# Contributor: Marios Abatis <marios.archlinux ατ gmail δοτ com>
pkgname=chemical-mime-data
pkgver=0.1.94
pkgrel=4
pkgdesc="Collection of data files to add support for various chemical MIME types"
arch=('i686' 'x86_64')
url="http://chemical-mime.sourceforge.net/"
license=('LGPL')
depends=('shared-mime-info' 'libxslt' 'gnome-mime-data')
makedepends=('pkgconfig' 'imagemagick' 'intltool' 'gettext')
source=('http://downloads.sourceforge.net/chemical-mime/chemical-mime-data-0.1.94.tar.gz')
md5sums=('ca54b5fbd7f43ee5380e394bfd273b95')
install=$pkgname.install

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-update-database
  make || return 1
  make DESTDIR=${pkgdir} install
}
