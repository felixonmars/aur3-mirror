# Contributor: Delphos-Sensei <delphos.sensei@gmail.com>
pkgname=sugar-activity-irc
_realname=irc
pkgver=5
pkgrel=1
pkgdesc="Sugar IRC Client."
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sucrose' 'fructose')
depends=('sugar')
source=('irc-5.xo')
md5sums=('65ca969a1f82d2e56ca3d46091c55fce')

build() {
  cd "$srcdir/IRC.activity"
  ./setup.py install --prefix="$pkgdir/usr" || return 1
}

# vim:set ts=2 sw=2 et:
