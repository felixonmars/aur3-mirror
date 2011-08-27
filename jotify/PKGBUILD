# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgname=jotify
pkgver=090b45f # name of tarball of the same date...
pkgrel=1
pkgdesc="A Spotify client written in Java"
arch=('i686' 'x86_64')
url="http://jotify.felixbruns.de/"
license=('custom')
depends=('java-runtime')
source=(http://jotify.felixbruns.de/jotify.jar
        LICENSE
	jotify.sh
	jotify.desktop
	jotify.xpm)
md5sums=('40f420dbe8c46f3f19c6c60b071249ce' '58cec278eb546b9eb374fc0d7f11d18b'\
         '3b5b04488c498008409422884b4226cf' 'd30817a8f3feb2469430c0d1cff198b1'\
         '76aa5301d460ed999ba5d11e548dbde5')

build() {
  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 $pkgname.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
