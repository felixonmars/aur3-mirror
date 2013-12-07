# Maintainer: Andrey Makarov <xdersd@gmail.com>

_gitname='vk4xmpp'
pkgname="$_gitname-git"
pkgver=d50dd52
pkgrel=1
pkgdesc="XMPP vk.com transport service"
arch=('any')
url="https://github.com/mrDoctorWho/vk4xmpp"
license=('MIT')
depends=('python2')
makedepends=('git')
source=('git://github.com/mrDoctorWho/vk4xmpp.git')
md5sums=('SKIP')

_sysuser="nobody"

pkgver() {
  cd "$srcdir/$_gitname"
  #echo `git rev-list HEAD --count && git rev-parse --short HEAD` | tr " " .
  git describe --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package() {
  cd "$srcdir/$_gitname"
  
  install -d "$pkgdir/usr/share/$_gitname"
  cp -R * "$pkgdir/usr/share/$_gitname"

  install -Dm644 "Config_example.txt" "$pkgdir/etc/vk4xmpp_example.conf"
  install -Dm644 "systemd/vk4xmpp.service" "$pkgdir/usr/lib/systemd/system/vk4xmpp.service"

  install -dm755 --owner=nobody "$pkgdir/var/lib/$_gitname"
  sed -i -E "s:(DatabaseFile = \")[^\"]*(\"):\1/var/lib/vk4xmpp/users.db\2:" "$pkgdir/etc/vk4xmpp_example.conf"
  install -dm755 --owner=nobody "$pkgdir/var/run/$_gitname"
  sed -i -E "s:(pidFile = \")[^\"]*(\"):\1/var/run/vk4xmpp/vk4xmpp.pid\2:" "$pkgdir/etc/vk4xmpp_example.conf"
  install -dm755 --owner=nobody "$pkgdir/var/log/$_gitname"
  sed -i -E "s:(logFile = \")[^\"]*(\"):\1/var/log/vk4xmpp/vk4xmpp.log\2:" "$pkgdir/etc/vk4xmpp_example.conf"
  sed -i -E "s:(crashDir = \")[^\"]*(\"):\1/var/log/vk4xmpp\2:" "$pkgdir/etc/vk4xmpp_example.conf"
}

