# Maintainer: speps <speps at aur dot archlinux dot org>

_user=umlaeute
_kver="`uname -r | cut -d"." -f1,2`-ARCH"
pkgname=v4l2loopback
pkgver=0.8.0
pkgrel=1
pkgdesc="A kernel module to create V4L2 loopback devices"
arch=(i686 x86_64)
url="https://github.com/$_user/$pkgname/"
license=('GPL')
depends=('glibc')
makedepends=('linux-headers' 'help2man')
optdepends=('v4l-utils: for v4l2loopback-ctl and utils'
            'gstreamer0.10: for v4l2loopback-ctl and utils')
install="$pkgname.install"
source=("${url}tarball/v$pkgver")
md5sums=('757571731ee28b1bbf58eb1c6bf5a9d2')

build() {
  cd $_user-$pkgname-*
  make

  # example utils
  cd examples

  # path fix
  sed -i "s/\.\/utils\///" restarting-writer.sh

  # yuv4mpeg_to_v4l2 mod for flash
  sed "s/YUV420/YVU420/" yuv4mpeg_to_v4l2.c > \
                        yuv4mpeg_to_v4l2_flash.c
  sed -i "1s/$/ yuv4mpeg_to_v4l2_flash/" Makefile

  make
}

package() {
  cd $_user-$pkgname-*
  make DESTDIR="$pkgdir/" PREFIX=/usr install-{man,utils}

  # module
  install -Dm644 $pkgname.ko \
    "$pkgdir/usr/lib/modules/extramodules-$_kver/$pkgname.ko"

  # docs
  install -Dm644 doc/v4l2.html \
    "$pkgdir/usr/share/doc/$pkgname/v4l2.html"
  install -Dm644 README NEWS \
    "$pkgdir/usr/share/doc/$pkgname"

  # examples
  cd examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 {*.c,README,Makefile} \
    "$pkgdir/usr/share/$pkgname/examples"
  install -Dm755 {yuv4mpeg_to_v4l2{,_flash},restarting-writer.sh} \
    "$pkgdir/usr/bin"
  install -Dm755 test "$pkgdir/usr/bin/$pkgname-test"
}

# vim:set ts=2 sw=2 et:
