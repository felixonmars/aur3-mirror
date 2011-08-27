# Maintainer: Andy Kluger <gmail: AndyKluger>
pkgname=chipmunk-radio
pkgver=0.1.9
pkgrel=2
pkgdesc="GTK+ Last.fm client built on Shell.FM and pyLast"
arch=('any')
url="http://shell-fm.wikidot.com/hack:chipmunk-gtk-interface"
license=('GPL')
depends=('dbus-python' 'hicolor-icon-theme' 'socat' 'python2-pygtkhelpers-hg' 'python2-pylast' 'shell-fm-git')
optdepends=('python-keybinder: bind keys to standard keysyms (XF86AudioPlay, etc.)'
            'python-notify: display notifications'
            'surl: shorten the urls you share')
source=(http://cdn.bitbucket.org/EvilGnome/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('b34bf928be0d7ba628a165dea474b7aa')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 chipmunk-radio.sh ${pkgdir}/usr/bin/$pkgname
  install -Dm755 chipmunk-radio.py ${pkgdir}/usr/share/$pkgname/$pkgname.py
  install -Dm755 chipmunk-radio.glade ${pkgdir}/usr/share/$pkgname/$pkgname.glade
  install -Dm755 chipmunk-radio.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm755 chipmunk-radio.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png
}
