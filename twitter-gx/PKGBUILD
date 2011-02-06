# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>

pkgname=twitter-gx
pkgver=1.1
pkgrel=2
pkgdesc="A simple script to submit Twitter tweets from the command line or a zenity dialog"
arch=('any')
url="http://twitter-gx.googlecode.com/"
license=('BSD')
depends=('bash' 'curl' 'zenity')
install=$pkgname.install
source=(http://twitter-gx.googlecode.com/files/twitter-1.1
        LICENSE)
md5sums=('12c8f40bc400621c869ce4406bc03d07'
         '89526b73c222587af78da8a6e8c9cacf')

build() {
  cd "$srcdir"
  install -Dm755 twitter-1.1 "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
