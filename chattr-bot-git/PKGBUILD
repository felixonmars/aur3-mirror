# Maintainer: Benjamin Campbell <benji@benjica.com>
pkgname=chattr-bot-git
pkgver=0.0.1.r1.ga9c62fe
pkgrel=4
pkgdesc="A simple IRC bot written in Go"
arch=('x86_64' 'i386')
backup=('etc/chattr/config.json')
url="http://github.com/benjic/chattr-bot"
license=('MIT')
makedepends=('git' 'go')
source=($pkgname::'git+https://github.com/benjic/chattr-bot.git'
        'config.json'
        'service')
md5sums=('SKIP'
         '805b04df3ef06d716b92373e22a043af'
         'd6537fe29e96088d181186d4ee2d8bfd')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export GOPATH=$srcdir
  cd $srcdir/$pkgname
  go get github.com/benjic/irc
  go build -o chattr-bot
}

package() {
  install -Dm754 ../service $pkgdir/etc/systemd/system/multi-user.target.wants/chattr-bot.service
  install -Dm755 ../config.json $pkgdir/etc/chattr/config.json
 
  mkdir -p $pkgdir/var/log/chattr

  cd "$srcdir/$pkgname"

  install -Dm755 chattr-bot $pkgdir/usr/bin/chattr-bot
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
