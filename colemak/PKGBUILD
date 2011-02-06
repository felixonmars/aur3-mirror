# Contributor: Dr.Egg <hondoheal@gmail.com>
# Maintainer: Jonathan Schmidt <j.schmidt@archlinux.us>
pkgname=colemak
pkgver=1.0
pkgrel=3
pkgdesc="Colemak keyboard layout (for console)"
arch=('i686' 'x86_64')
url="http://colemak.com"
license=('GPL')
source=(http://colemak.com/pub/unix/${pkgname}-${pkgver}.tar.gz)
md5sums=('f6fe70f1943b77dff60bb20139cb2942')

build() {
  mkdir -p $pkgdir/usr/share/kbd/keymaps/i386/colemak
  cd $srcdir/$pkgname-$pkgver/linux_console

  ## Maps Caps_Lock to LWIN.
  sed -i '{
           / 39/{
                 s/ o/\+o/
                 s/ O/\+O/
                }
           $a\keycode 125 = Caps_Lock
          }' colemak.iso15.kmap

  gzip -nc colemak.iso15.kmap > $pkgdir/usr/share/kbd/keymaps/i386/colemak/colemak.map.gz
}

# vim:set ts=2 sw=2 et:
