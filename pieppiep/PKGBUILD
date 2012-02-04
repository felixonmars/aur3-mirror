# Maintainer: Christoph Stahl <christoph.stahl@udo.edu>
pkgname=pieppiep
pkgver=0.5.4
pkgrel=1
pkgdesc="Pieppiep is a Twitterclient for your Terminal, written (mostly) in Bash."
url="http://opensomething.org/pieppiep"
arch=( 'any' )
license=( 'custom' )
depends=( 'bash' 'jsawk-git' 'perl' 'openssl')
source=( "http://opensomething.org/files/$pkgname-$pkgver.tar.bz2" )
md5sums=('fe54b027c90fb3a0c90053f3792606f1')

package() {
  cd "$srcdir/$pkgname-$pkgver"  || return 1
  install -D -m755 TwitterOAuth.sh $pkgdir/usr/bin/TwitterOAuth.sh || return 1
  install -D -m755 OAuth.sh $pkgdir/usr/bin/OAuth.sh || return 1
  install -D -m755 pieppiep $pkgdir/usr/bin/pieppiep || return 1
}
