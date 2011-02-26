# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=gst-plugins-pps
pkgver=0.0.18.1
pkgrel=1
pkgdesc="PPStream plugin for gstreamer"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
depends=('gstreamer0.10' 'gstreamer0.10-base-plugins' 'libppswrapper')
makedepends=('pkgconfig' 'intltool')
source=("http://totem-pps.googlecode.com/files/$pkgname-$pkgver.tar.gz")
conflicts=('gst-plugins-pps-git')
md5sums=('98567d211703a721d03d12c3765b8122')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
