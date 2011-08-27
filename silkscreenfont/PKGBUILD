# Contributor Kiril Zyapkov <kikcho at gmail dot com>
pkgname=silkscreenfont
pkgver=1
pkgrel=1
pkgdesc="A four member type family for your Web graphics."
url="http://kottke.org/plus/type/silkscreen/index.html"
_realname=silkscreen
license=('freeware')
arch=('i686' 'x86_64')
depends=(xorg-font-utils fontconfig)
install=silkscreen.install
source=(http://kottke.org/plus/type/silkscreen/download/${_realname}.tar.gz)
md5sums=('65906f9bfd73c4042e609a7f80abe168')

build() {
  cd $startdir/src/
  chmod 0644 *.ttf
  mkdir -p $startdir/pkg/usr/share/fonts/TTF
  cp *.ttf $startdir/pkg/usr/share/fonts/TTF
}
