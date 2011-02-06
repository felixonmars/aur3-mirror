# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=twitdocdesktop
pkgver=0.8
pkgrel=1
pkgdesc="App to share your documents on twitter easily"
arch=('i686' 'x86_64')
url="http://www.twitdoc.com"
license=('unknown')
depends=('adobe-air')
source=(http://twitdoc.com/air/TwitDocDesktop.air 'twitdoc')
md5sums=('938969bae8b7b6ef95e9478990a78455' \
         'a3f701171772d6356b2e15f484a66f6c') 

build() {
  cd $srcdir/

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  install TwitDocDesktop.air $pkgdir/opt/$pkgname
  install -m755 twitdoc $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
