# Maintainer: Tanguy ALEXIS <alexis.tanguy@yahoo.fr>

pkgname=magicassistant-gtk-multi
pkgver=1.2.5.2
pkgrel=0
pkgdesc="Card Browser, Library Organizer, Deck Builder and Tournament Manager for Magic the Gathering Card Game"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/mtgbrowser/"
license=('EPL')
depends=(gtk2 jre7-openjdk libwebkit unzip libwebkit)
source=('source')
md5sums=('md5sums')
if test "$CARCH" == "x86_64"; then
source=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-gtk.linux.x86_64.zip magicassistant.desktop)
md5sums=('447dcda1a06f130420ea88cbca7aa2a7'
         '37f143dbb28032d4fcc7a0a6e4e7f239')
fi
if test "$CARCH" == "i686"; then
source=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-gtk.linux.x86.zip magicassistant.desktop)
md5sums=('2cdb3fdc69acd03bda37191e8e942892'
         '37f143dbb28032d4fcc7a0a6e4e7f239')
fi

build(){
  cd $srcdir
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt
  install -Dm644 $srcdir/magicassistant.desktop $pkgdir/usr/share/applications/magicassistant.desktop
  cp -r $srcdir/MagicAssistant $pkgdir/opt
  ln -s /opt/MagicAssistant/magicassistant $pkgdir/usr/bin/magicassistant
}


# vim:set ts=2 sw=2 et: