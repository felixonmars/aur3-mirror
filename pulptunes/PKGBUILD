# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=pulptunes
pkgver=1.1.0
pkgrel=1
pkgdesc="The web server for iTunes"
arch=('i686' 'x86_64')
url="http://www.pulptunes.com/"
license=('gpl')
depends=('java-runtime' 'bash')
source=(http://downloads.sourceforge.net/pulptunes/pulpTunesSetup_generic_1.1.0.zip)
md5sums=('08d6081a7633542d5114ac8dcf09ec4c') 

build() {
  install -d $pkgdir/usr/share/java/$pkgname $pkgdir/usr/bin || return 1
  cp -rf $srcdir/$pkgname/lib/ $pkgdir/usr/share/java/$pkgname/lib || return 1
  install -m755 $srcdir/pulptunes/PulpTunes.jar $pkgdir/usr/share/java/$pkgname/ || return 1
 install -m755 $startdir/pulptunes.sh $pkgdir/usr/bin/pulptunes
   
   
}

# vim:set ts=2 sw=2 et:
