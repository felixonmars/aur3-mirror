# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=sokobano
_pkgname=Sokobano
pkgver=1.0.3
pkgrel=1
pkgdesc="An entertaining Sokoban game featuring nice 3D graphics."
url="http://sokobano.sourceforge.net/"
arch=('i686'  'x86_64')
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
install=$pkgname.install
source=(http://heanet.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgname%20$pkgver/$_pkgname.zip
        $pkgname.sh
        $pkgname.desktop)
noextract=($_pkgname.zip)
md5sums=('e95c6e7051ef17a3c25e703f9c53c8f2'
         '12973db305ba9d69321546907e340ed0'
         '34788db62fc44033d161f393eaf11159')

build() {
  unzip -q -o $_pkgname.zip -d $srcdir

  rm $srcdir/$_pkgname/{startMac.command,startWin{.bat,.exe}}
  rm -r $srcdir/$_pkgname/{src,lib/lwjgl-2.0.1/native/{macosx,solaris,win32}}

  if [ "$CARCH" = "i686" ]; then
    rm $srcdir/$_pkgname/lib/lwjgl-2.0.1/native/linux/*64.so
  else
    rm $srcdir/$_pkgname/lib/lwjgl-2.0.1/native/linux/{libjinput-linux.so,liblwjgl.so,libopenal.so}
  fi

  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/$_pkgname/* $pkgdir/opt/$pkgname
  chown -R root:games $pkgdir/opt/$pkgname/res/{config,player,levelSet/*/highScores.xml}
  chmod -R 775 $pkgdir/opt/$pkgname/res/{config,player,levelSet/*/highScores.xml}
  chmod 775 $pkgdir/opt/$pkgname/startLinux.sh

  # Prevent overwriting 
  # - configuration files
  mv $pkgdir/opt/$pkgname/res/config $pkgdir/opt/$pkgname/res/config.new
  mv $pkgdir/opt/$pkgname/res/player $pkgdir/opt/$pkgname/res/player.new
  # - high scores
  for _i in {0..6}; do
      mv -T $pkgdir/opt/$pkgname/res/levelSet/$_i/highScores.xml $pkgdir/opt/$pkgname/res/levelSet/$_i/highScores.xml.new
  done

  install -D -m755 $startdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/$_pkgname/Readme.txt $pkgdir/usr/share/doc/$pkgname/Readme.txt
}
# vim:set ts=2 sw=2 et:
