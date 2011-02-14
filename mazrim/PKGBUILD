# Contributor: adamruss
# Maintainer: shulamy <shulamy at regba.org.il>
pkgname=mazrim
pkgver=2.0
pkgrel=2
pkgdesc="A Utillity For Watching Stream Videos with mediaplayer - eng / heb gui"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mazrim/"
license=('GPL')
depends=('pythoncard2')
optdepends=('gnome-mplayer: mediaplayer support or'
            'mplayer-x: mediaplayer support or'
            'vlc: mediaplayer support or... try other')

install=mazrim.install
source=(http://downloads.sourceforge.net/sourceforge/mazrim/mazrim_$pkgver-1_all.deb mazrim.patch)
md5sums=('dcfe823cdc684333581a9bcede5b97b6'
         '81142cd11c17eb428b90d35f86c54dfc')

build() {
   local ROOT=../pkg
   ar x mazrim_$pkgver-1_all.deb
   mkdir -p mazrim
   tar xf data.tar.gz -C mazrim
   cp $startdir/mazrim.patch  $startdir/src/mazrim/etc/mazrim.patch
   cd $startdir/src/mazrim/etc
   patch -up0 -i mazrim.patch
   cd $startdir/src
   sed -i '3c exec python2 Mazrim.py' mazrim/usr/bin/mazrim
   cp -r mazrim/* $pkgdir
   rm -rf control.tar.gz data.tar.gz debian-binary
}


