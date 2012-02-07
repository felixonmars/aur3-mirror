pkgname=twitbash
pkgver=1.0.0
pkgrel=2
pkgdesc="Script written in Bash to perform various twitter functions. (OAuth and Custom Application capable)"
arch=(any)
url="http://aur.archlinux.org/packages.php?ID=40616"
license=('GPL')
depends=('bash' 'curl')
source=('http://served.kittykatt.us/projects/packages/twitbash.tar.gz')
md5sums=('69a93b215ff3e061f82792375883ad6e')
install=$pkgname.install

build() {
  cd ${srcdir}

  install -d $pkgdir/usr/bin
  install -d $pkgdir$HOME/.config/twitbash

  cp OAuth.sh $pkgdir$HOME/.config/twitbash/
  cp TwitterOAuth.sh $pkgdir$HOME/.config/twitbash/
  cp twitbash $pkgdir/usr/bin/
}
