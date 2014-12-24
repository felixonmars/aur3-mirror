# Maintainer: tuxce <tuxce.net@gmail.com>
pkgname=customizepkg
pkgver=0.2.1
pkgrel=3
pkgdesc="A tool to modify automatically PKGBUILD" 
url="https://github.com/archlinuxfr/customizepkg"
license="GPL" 
arch=('any')
depends=() 
source=(https://github.com/archlinuxfr/$pkgname/archive/$pkgver.tar.gz)
md5sums=('SKIP')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 "$pkgname" "$pkgdir"/usr/bin/$pkgname
  install -D -m 755 "$pkgname.d/mplayer.example" "$pkgdir"/etc/customizepkg.d/mplayer.example 
}

# vim:set ts=2 sw=2 et:
