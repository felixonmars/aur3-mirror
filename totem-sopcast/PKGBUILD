# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=totem-sopcast
pkgver=0.0.4
pkgrel=1
pkgdesc="sopcast browser for totem"
arch=("i686" "x86_64")
url="http://cgit.freedesktop.org/~jinghua/totem-sopcast/"
license=('GPL')
depends=('totem' 'gnome-python' 'gst-plugins-sopcast')
makedepends=('intltool')
source=("http://people.freedesktop.org/~jinghua/distfiles/$pkgname-$pkgver.tar.gz")
conflicts=('totem-sopcast-git')
md5sums=('f361970dce963ef349439d7caa4e386c')

build() {
  cd $srcdir/$pkgname-$pkgver
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
