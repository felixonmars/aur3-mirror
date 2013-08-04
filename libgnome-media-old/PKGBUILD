# Maintainer: Gerasev Kirill  <gerasev.kirill@gmail.com>

pkgname=libgnome-media-old
_realname=${pkgname/-old/}
pkgver=2.30
pkgrel=1
pkgdesc="Runtime libraries for the GNOME2 media utilities. From packages.debian.org"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.gnome.org"
makedepends=('autoconf' 'automake1.10' 'gcc' 'pkgconfig' 'gnome-common')
depends=('libunique')
provides=('libgnome-media')
groups=('lib')
conflicts=('libgnome-media-profiles')

source=(
        'http://ftp.de.debian.org/debian/pool/main/g/gnome-media/gnome-media_2.30.0.orig.tar.gz'
        'remove_unnecessary_dist.patch'
        )
md5sums=(
        '2e7fa03c5dc922e8e5434a9a12d15bf5'
        'cb117a7734520f157d7454cd892092d9'
        )

build() {
  cd "$srcdir/gnome-media-2.30.0"
  msg "Starting make..."
  
  patch -Np1 -i   ../../remove_unnecessary_dist.patch
  export AUTOMAKE=automake-1.10 
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "$srcdir/gnome-media-2.30.0"
  make DESTDIR="$pkgdir/" install
}
