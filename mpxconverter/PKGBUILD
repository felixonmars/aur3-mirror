# Contributor: Sergio Jovani <lesergi@gmail.com>
pkgname=mpxconverter
pkgver=1.2
pkgrel=2
pkgdesc="Bytessence MPxConverter is a simple user interface for AMV-Codec-Tools."
arch=('i686')
url="http://www.bytessence.com/bmpxc.html"
license=('GPL')
depends=(faad2 xvidcore lame gtk2)
source=(http://www.bytessence.com/download/bmpxconverter/MPxConverterL.tar.gz mpxconverter.desktop)

build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/share/mpxconverter
  cp -r Changelog.txt Codecs License.txt Localization MPxConverter MPxConverter.png Profiles Readme.txt $pkgdir/usr/share/mpxconverter
  touch $pkgdir/usr/share/mpxconverter/MPxConfig.ini
  chmod 777 $pkgdir/usr/share/mpxconverter/MPxConfig.ini
  mkdir -p $pkgdir/usr/share/applications
  cp mpxconverter.desktop $pkgdir/usr/share/applications/
}
md5sums=('aaa5d41697ab57c37dc7d5b989e2ce05'
         'a1994af9d39ed41eb4791ccce30f11df')
