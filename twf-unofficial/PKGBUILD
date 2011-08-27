# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=twf-unofficial
pkgver=0.4
pkgrel=1
pkgdesc="The Widget Factory(twf) is a theme preview application for GTK2. This is a modification to the original Widget Factory."
url="http://www.gtk-apps.org/content/show.php/The+Unofficial+Widget+Factory?content=83361"
license=('GPL')
depends=('gtk2' 'libglade' 'cairo')
source=(http://www.gtk-apps.org/CONTENT/content-files/83361-twf-$pkgver.tar.bz2)
md5sums=('ee7c99cefb80c470be743ad37f1ac7ba')
arch=('i686' 'x86_64')
conflicts=('twf')

build() {
  cd $srcdir/twf-$pkgver
  ./autogen.sh --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
