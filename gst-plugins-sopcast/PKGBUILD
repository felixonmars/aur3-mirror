# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=gst-plugins-sopcast
pkgver=0.0.3
pkgrel=1
pkgdesc="A sopcast plugin for gstreamer"
arch=("i686" "x86_64")
url="http://cgit.freedesktop.org/~jinghua/gst-plugins-sopcast/"
license=('GPL')
depends=('gstreamer0.10' 'gstreamer0.10-base-plugins' 'sopcast')
makedepends=('pkgconfig' 'intltool')
source=("http://people.freedesktop.org/~jinghua/distfiles/$pkgname-$pkgver.tar.gz")
conflicts=('gst-plugins-sopcast-git')
md5sums=('71b76e6ab8f5fc1840eed527e6627fd4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}


