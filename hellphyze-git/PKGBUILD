# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=hellphyze-git
pkgver=16.f9c883f
pkgrel=1
pkgdesc="This is an Open Source GUI Telnet client designed for Linux-based operating systems"
arch=('any')
url="https://github.com/wifiextender/hellphyze"
license=('GPL3')
depends=('python2-gobject' 'python2' 'webkitgtk' 'pywebkitgtk' 'gpgme')
makedepends=('git')
source=('git+https://github.com/wifiextender/hellphyze.git'
         hellphyze.desktop
         hellphyze.sh)
md5sums=('SKIP'
         '430cf290e377899bd011ac7fc98c21e9'
         'b10973802a9ae45aaad32ad97b2e6e56')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/hellphyze
  cp -rf hellphyze/* $pkgdir/usr/share/hellphyze

  # Start file
  install -Dm755 hellphyze.sh $pkgdir/usr/bin/hellphyze

  # Desktop icon
  install -Dm644 hellphyze.desktop $pkgdir/usr/share/applications/hellphyze.desktop
  install -Dm644 hellphyze/data_hellphyze/hellphyze_icon.png $pkgdir/usr/share/pixmaps/hellphyze_icon.png
}

pkgver() {
  cd $srcdir/hellphyze
  echo $(git rev-list --count master).$(git rev-parse --short master)
}