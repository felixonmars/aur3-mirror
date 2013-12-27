# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=pshot-git
pkgver=23.a7eff0d
pkgrel=1
pkgdesc="Screenshot utility for your Linux box, inspirtation taken by Ksnapshot"
arch=('any')
url="https://github.com/wifiextender/pshot"
license=('GPL3')
depends=('python2-gobject' 'python2' 'webkitgtk' 'pywebkitgtk' 'scrot' 'imagemagick')
makedepends=('git')
source=('git+https://github.com/wifiextender/pshot.git'
         pshot.desktop
         pshot.sh)
md5sums=('SKIP'
         'fe8e69afeaf3933e43cf132cadc240b3'
         '6d79a852afe71a21be720d7b773db6cf')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/pshot
  cp -rf pshot/* $pkgdir/usr/share/pshot

  # Start file
  install -Dm755 pshot.sh $pkgdir/usr/bin/pshot

  # Desktop icon
  install -Dm644 pshot.desktop $pkgdir/usr/share/applications/pshot.desktop
  install -Dm644 pshot/data_pshot/pshot_logo.png $pkgdir/usr/share/pixmaps/pshot_logo.png
}

pkgver() {
  cd $srcdir/pshot
  echo $(git rev-list --count master).$(git rev-parse --short master)
}