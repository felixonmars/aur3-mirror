# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=jlop
pkgver=1.05.264
pkgrel=1
pkgdesc="Java OpenNap client like winmx"
arch=('i686' 'x86_64')
url="http://jlop.sourceforge.net/JLop.html"
license=('gpl')
depends=('java-runtime' 'bash')
source=(http://downloads.sourceforge.net/jlop/JLop-install-src-1.05.264.zip)
md5sums=('fd260b14a5002e3a7d145dcb4c0c549b') 

build() {
  cd "srcdir/JLop-install-src-ToRelease
  install -d $pkgdir/usr/share/java/$pkgname $pkgdir/usr/bin || return 1
  install -m755 $srcdir/JLop-install-src-ToRelease/JLop.jar $pkgdir/usr/share/java/$pkgname/jlop.jar || return 1
   chmod a+x $startdir/jlop.sh 
   install -m755 $startdir/jlop.sh $pkgdir/usr/bin/jlop
   
}

# vim:set ts=2 sw=2 et:
