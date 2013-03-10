pkgname=icarustouch
pkgver=1.0
pkgrel=2
pkgdesc="Multitouch keyboard for MIDI devices using the Kivy toolkit"
pkgsrc=stocyr-IcarusTouch-067d53f

arch=('i686' 'x86_64')
license=('GPLv3')

url="https://github.com/stocyr/IcarusTouch"

depends=('kivy>=1.0.8' 'portmidi')
optdepends=('fluidsynth: for a software MIDI device synthesizer')

source=("$pkgname-$pkgver.tar.gz::https://github.com/stocyr/IcarusTouch/tarball/master/$pkgsrc.tar.gz"
icarustouch.desktop
icarustouch.png
icarustouch.kv)

install=icarustouch.install

md5sums=('77f417d7f931072686b00ff105b5236b'
         '14d0b8f4751c0965f44d3adcef5d35b2'
         'ef4379c45c9b2da475251b4af2d429b4'
         '3d75899482208dbc9557886a6e4d27bf')

package() {  
  mkdir -p $pkgdir/opt/$pkgname/graphics
  mkdir -p $pkgdir/opt/$pkgname/kivy
  mkdir -p $pkgdir/usr/share/applications
  
  install -m755 ./icarustouch.desktop $pkgdir/usr/share/applications
  install -m755 ./icarustouch.png $pkgdir/opt/$pkgname
  
  cd $srcdir/$pkgsrc
  install -m755 ./*.txt $pkgdir/opt/$pkgname
  install -m755 ./README.md $pkgdir/opt/$pkgname
  
  cd $srcdir/$pkgsrc/src
  cp -R * $pkgdir/opt/$pkgname/kivy
  cp $srcdir/icarustouch.kv $pkgdir/opt/$pkgname/kivy
  
  cd $srcdir/$pkgsrc/graphics
  cp -R * $pkgdir/opt/$pkgname/graphics
  
  touch $pkgdir/opt/$pkgname/kivy/icarustouch.ini
  chmod 777 $pkgdir/opt/$pkgname/kivy/icarustouch.ini
}
