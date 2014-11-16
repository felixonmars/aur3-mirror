# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ivo@arch>
pkgname=konzolno-radio
pkgver=1.0.6
pkgrel=1
pkgdesc="Console internet radio to listen to Bulgarian radio stations 
online in GNU/Linux"
arch=('any')
url="https://github.com/ivoarch/konzolno-radio"
license=('MIT')
depends=('bash' 'mplayer')
source=("https://github.com/ivoarch/konzolno-radio/archive/1.0.6.tar.gz")
md5sums=('c12a1763b4f2acb974af6b9cb0ee53f6')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" 
"$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

