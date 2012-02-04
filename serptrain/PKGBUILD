# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=serptrain
_pkgname=SerpTrain
pkgver=0.6.0
pkgrel=1
pkgdesc="A puzzle game."
url="http://serptrain.serpedon.de/"
arch=('i686')
license=('GPLv2' 'GPLv3')
depends=('zlib' 'libpng' 'qt')
source=($pkgname.sh
        $pkgname.desktop)
md5sums=('25b28908a15babece78391f8df00f320'
         'f9cc68cdb18ac3ea0f6b1dad289bb8f6')

_source=http://serpedon.de/Download/Aeltere-Versionen/$_pkgname/$pkgver/Quellcode/

build() {
  cd $srcdir
  msg "Connecting to $_pkgname server..."
  wget -Nc --referer=http://serpedon.de $_source -O $_pkgname-source-$pkgver.tar.gz
  tar -xf $_pkgname-source-$pkgver.tar.gz || return 1

  install -d $pkgdir{/opt/$pkgname,/usr/bin,/usr/share/licenses/$pkgname}

  msg "Compiling..."
  qmake || return 1
  make || return 1

  cp -r $srcdir/{HOMEDIR_.SerpTrain/,icons/,levels/} $pkgdir/opt/$pkgname/
  cp -r $srcdir/licenses/* $pkgdir/usr/share/licenses/$pkgname/

  install -D -m755 $_pkgname $pkgdir/opt/$pkgname/$pkgname
  install -D -m755 $startdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/icons/TrainIconsVonKatrin/TrainVonKatrin.png $pkgdir/usr/share/pixmaps/$pkgname/TrainVonKatrin.png
}
# vim:set ts=2 sw=2 et:
