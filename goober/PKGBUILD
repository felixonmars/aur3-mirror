# Maintainer: Mladen Pejakovic <pejakm@gmail.com>
# Contributor: Patrick Baumgart <Baumi@gmx.com>

pkgname=goober
pkgver=3.0.0
pkgrel=2
pkgdesc="Goober Instant Messenger"
url="http://www.goober.com/"
license=('goober:nonfree')
arch=('i686' 'x86_64')
depends=('qt4' 'qca' 'qca-ossl' 'portaudio' 'phonon' 'speex' 'glew' 'openssl')
optdepends=()
conflicts=()
provides=()

  if [ "$CARCH" = "x86_64" ]; then
source=("${pkgname}-${pkgver}.tar.gz"::"http://www.goober.com/en/downloads/startDownload/software/linux64" \
	"goober.desktop"
	"goober16.png"
	"goober22.png"
	"goober32.png"
	"goober64.png"
	"goober128.png")
md5sums=('2479e8695484c333c926982126dfd5ea'
         'bb02df5852814f08af38e6eb2437546d'
         'e2ff37d95d25c0b4ca4ec79ad9758933'
         '1b1c15d261ea4816c7a1dffb774f9aec'
         'cf331e5c074e715eed37249a9f26e377'
         'cf46472ccbb2f7ee337ddc7fa7720d25'
         '31def24ccd51b5ef3da13586289294cc')
  else
source=("${pkgname}-${pkgver}.tar.gz"::"http://www.goober.com/downloads/startDownload/software/linux32" \
	"goober.desktop"
	"goober16.png"
	"goober22.png"
	"goober32.png"
	"goober64.png"
	"goober128.png")
md5sums=('f1d0f08fa1172d785283db23dc160257'
         'bb02df5852814f08af38e6eb2437546d'
         'e2ff37d95d25c0b4ca4ec79ad9758933'
         '1b1c15d261ea4816c7a1dffb774f9aec'
         'cf331e5c074e715eed37249a9f26e377'
         'cf46472ccbb2f7ee337ddc7fa7720d25'
         '31def24ccd51b5ef3da13586289294cc')
  fi

build() {
  install -m 755 -d $pkgdir/usr/bin $pkgdir/usr/lib/$pkgname/plugins/{applications,imageformats,messenger,sqldrivers} $pkgdir/usr/lib/$pkgname/plugins/imageformats/imageformats $pkgdir/usr/share/$pkgname/{tests,translations} $pkgdir/usr/share/$pkgname/skins/condor $pkgdir/usr/share/$pkgname/smileys/default $pkgdir/usr/share/$pkgname/sounds/standard/smilies
  install -m 755 -D $srcdir/goober/acknowledgements.txt $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/aec-params.config $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/countries.xml $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/license_de.txt $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/license_en.txt $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/version.vrs $pkgdir/usr/share/$pkgname
  install -m 755 -D $srcdir/goober/crash_handler $pkgdir/usr/bin
  install -m 755 -D $srcdir/goober/goober $pkgdir/usr/bin
  install -m 755 -D $srcdir/goober/plugins/applications/* $pkgdir/usr/lib/$pkgname/plugins/applications
  install -m 755 -D $srcdir/goober/plugins/messenger/* $pkgdir/usr/lib/$pkgname/plugins/messenger
  install -m 755 -D $srcdir/goober/plugins/sqldrivers/* $pkgdir/usr/lib/$pkgname/plugins/sqldrivers
  install -m 755 -D $srcdir/goober/plugins/imageformats/imageformats/* $pkgdir/usr/lib/$pkgname/plugins/imageformats/imageformats
  install -m 755 -D $srcdir/goober/skins/condor/* $pkgdir/usr/share/$pkgname/skins/condor
  install -m 755 -D $srcdir/goober/smileys/default/* $pkgdir/usr/share/$pkgname/smileys/default
  install -m 755 $srcdir/goober/smileys/icqemoticons.xml $pkgdir/usr/share/$pkgname/smileys
  install -m 755 $srcdir/goober/smileys/msnemoticons.xml $pkgdir/usr/share/$pkgname/smileys
  install -m 755 -D $srcdir/goober/sounds/standard/*.wav $pkgdir/usr/share/$pkgname/sounds/standard
  install -m 755 -D $srcdir/goober/sounds/standard/smilies/* $pkgdir/usr/share/$pkgname/sounds/standard/smilies
  install -m 755 -D $srcdir/goober/tests/* $pkgdir/usr/share/$pkgname/tests
  install -m 755 -D $srcdir/goober/translations/* $pkgdir/usr/share/$pkgname/translations
  install -m 755 -D $srcdir/goober.desktop $pkgdir/usr/share/applications/goober.desktop
  install -m 755 -D $srcdir/goober/license_en.txt $pkgdir/usr/share/licenses/${pkgname}/license.txt
  # install -D -m 755 $srcdir/goober.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/goober.svg
  install -m 755 -D $srcdir/goober16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/goober.png
  install -m 755 -D $srcdir/goober22.png $pkgdir/usr/share/icons/hicolor/22x22/apps/goober.png
  install -m 755 -D $srcdir/goober32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/goober.png
  install -m 755 -D $srcdir/goober64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/goober.png
  install -m 755 -D $srcdir/goober128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/goober.png
  cp -a $srcdir/goober/lib* $pkgdir/usr/lib/
#   ln -s /usr/share/goober/goober $pkgdir/usr/bin/goober
}
