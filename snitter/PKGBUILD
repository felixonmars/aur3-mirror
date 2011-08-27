# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=snitter
pkgver=0.028
pkgrel=1
pkgdesc="Twitter application using adobe-air"
arch=('i686' 'x86_64')
url="http://www.getsnitter.com"
license=('unknown')
depends=('adobe-air')
source=(http://getsnitter.com/snitter.air 'snitter.sh')
md5sums=('5778df9842cd3a3fe1f141aa53e2f53d' \
'07b4e7cec943625348cf5c0d0422c92f') 

build() {
cd $srcdir/
  
 install -d $pkgdir/{usr/bin,opt/$pkgname}
 install snitter.air $pkgdir/opt/$pkgname/
 install -m755 snitter.sh $pkgdir/usr/bin/snitter 
}

# vim:set ts=2 sw=2 et:
