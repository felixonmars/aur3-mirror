# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=yoimnotpro
pkgver=65.153fc07
pkgrel=1
pkgdesc="Small archlinux app center by Aaron Caffrey"
arch=('any')
url="https://github.com/wifiextender/yoimnotpro/"
license=('GPL3')
depends=('gksu' 'python-gobject' 'python' 'webkitgtk' 'pywebkitgtk' 'gnome-themes-standard' 'gtk-engines')
makedepends=('git')
source=('git+https://github.com/wifiextender/yoimnotpro.git'
         yoimnotpro.desktop
         yoimnotpro.sh)
md5sums=('SKIP'
         '94dd75b82c353dec08fd2d913e55471b'
         '796ccd1c4ee05568ad9fea72e22b60ce')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/yoimnotpro
  cp -rf yoimnotpro/* $pkgdir/usr/share/yoimnotpro

  # Start file
  install -Dm755 yoimnotpro.sh $pkgdir/usr/bin/yoimnotpro

  # Desktop icon
  install -Dm644 yoimnotpro.desktop $pkgdir/usr/share/applications/yoimnotpro.desktop
  install -Dm644 yoimnotpro/ui/yoimnotpro_icon.png $pkgdir/usr/share/pixmaps/yoimnotpro.png  
}

pkgver() {
  cd $srcdir/yoimnotpro
  echo $(git rev-list --count master).$(git rev-parse --short master)
}