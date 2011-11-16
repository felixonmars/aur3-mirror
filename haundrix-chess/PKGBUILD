# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=haundrix-chess
pkgver=0.1.0
pkgrel=1
pkgdesc="Chess program that can be used for playing against your computer and for viewing/editing your PGN files."
arch=('i686' 'x86_64')
url="http://www.haundrix.com/"
license=('GPL3')
depends=('java-runtime')
install=$pkgname.install

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://www.haundrix.com/download/haundrix-0.1.0-Linux64bit.tar.gz
          http://a.fsdn.com/con/icons/ha/haundrix@sf.net/knight.png)
  md5sums=('e76aea8319596324faf8267522550ac6'
           '11038b48bd30f9dba52145201c5d43d3')
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://www.haundrix.com/download/haundrix-0.1.0-Linux32bit.tar.gz
          http://a.fsdn.com/con/icons/ha/haundrix@sf.net/knight.png)
  md5sums=('4a72c308cf86ae323a1d6ce4bea3726b'
           '11038b48bd30f9dba52145201c5d43d3')
fi

build() {
    cd $srcdir

   mkdir -p $pkgdir/usr/share/haundrix-chess
   cp -r haundrix/* $pkgdir/usr/share/haundrix-chess
   cd ..
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

   # Desktop icon
   install -Dm644 knight.png $pkgdir/usr/share/pixmaps/$pkgname.png
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}