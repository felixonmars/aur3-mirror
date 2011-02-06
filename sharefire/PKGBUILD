# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: Falcata <zauberexonar[at]gmail[dot]com>
pkgname=sharefire
pkgver=1.8
pkgrel=1
pkgdesc="News aggregator that lets you share stories via AIM,Facebook,Myspace,Twitter, email and more"
arch=('i686' 'x86_64')
url="http://www.sharefirereader.com/"
license=('BSD')
depends=('adobe-air')
source=(http://www.sharefirereader.com/bin/ShareFire1-8.air 'LICENSE' 'sharefire')
md5sums=('63e24177286617ba497681e70b9cb629'
         '24a7117471bb387422fa517483a46725'
         'c9a18e6d09501f495568ed37ca5017d5') 

build() {
  cd $srcdir/

  install -d $pkgdir/{opt/$pkgname,usr/{bin,share/licenses/$pkgname}}
  install ShareFire1-8.air $pkgdir/opt/$pkgname/sharefire-1.8.air
  install -m755 sharefire $pkgdir/usr/bin/
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
