# Original Author: zertyz <zertyz@gmail.com>

pkgname=pingendo
pkgver=2.0
pkgrel=2
pkgdesc="An WYSIWYG HTML5 editor focused on Bootstrap 3 UI"
arch=('x86_64')
url="http://www.pingendo.com/"
license="GPL"
depends=('libsystemd'
         'gconf')
makedepends=('unzip')
options=('!strip')
source=("http://pingendo.com/pingendo-linux-x86_64.zip"
	"pingendo.desktop")

package() {
  mkdir -p "$pkgdir/opt/"

  # zip has (had) a linux64/ folder hierarchy
  _srcdir="$srcdir"

  # remove garbage/unneeded files
  rm "$_srcdir"/README_linux.txt

  # copy to the /opt structure, make it runnable on archlinux environment and set permissions
  cp -a "$_srcdir" "$pkgdir/opt/$pkgname"
  ln -sf /usr/lib/libudev.so "$pkgdir/opt/$pkgname/libudev.so.0"

  rm -f "$pkgdir/opt/$pkgname/pingendo.desktop" "$pkgdir/opt/$pkgname/pingendo-linux-x86_64.zip"

  chmod 755 "$pkgdir/opt/$pkgname/Pingendo"
  install -D -m0644 "$srcdir/pingendo.desktop" "$pkgdir/usr/share/applications/pingendo.desktop"

  # when pingendo updates nwjs to use libudev.so.1 instead of libudev.so.0, we may uncomment those lines... by now, setting 
  # the LD_LIBRARY_PATH is needed (see pingendo.desktop), therefore running by typing the program name won't succeed
  #mkdir -p "$pkgdir/usr/local/bin"
  #ln -s "$_srcdir/Pingendo" "$pkgdir/usr/local/bin"

}

md5sums=('db0bc9f4f4d02a93e1e6764ccab8a85c'
         '7b0e31745f2de85b1ff0a24b75d52826')
