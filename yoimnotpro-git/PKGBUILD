# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=yoimnotpro-git
pkgver=16.92da7ca
pkgrel=1
pkgdesc="Small archlinux app center."
arch=('any')
url="https://github.com/wifiextender/yoimnotpro/"
license=('GPL3')
depends=('gksu' 'python2-gobject')
makedepends=('git')
source=('git+https://github.com/wifiextender/yoimnotpro.git'
         yoimnotpro.desktop
         yoimnotpro.sh)
md5sums=('SKIP'
         '94dd75b82c353dec08fd2d913e55471b'
         '9b99235b3f796d1a82d998a5f02bb918')

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