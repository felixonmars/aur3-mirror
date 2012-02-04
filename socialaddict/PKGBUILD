# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=socialaddict
pkgver=1.1
pkgrel=1
pkgdesc="Adobe AIR application that lets you use eleven social sites"
arch=('i686' 'x86_64')
url="http://www.twistermc.com/blog/2008/06/23/socialaddict"
license=('unknown')
depends=('adobe-air')
source=(http://www.twistermc.com/downloads/SocialAddict.air 'socialaddict')
md5sums=('cca622ae5acbe68a4b28668b37a2b40f' \
         '52803c78f215013d4f84dc197f10f2c3') 

build() {
  cd $srcdir/

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  install SocialAddict.air $pkgdir/opt/$pkgname/
  install -m755 socialaddict $pkgdir/usr/bin/
}
# vim:set ts=2 sw=2 et:
