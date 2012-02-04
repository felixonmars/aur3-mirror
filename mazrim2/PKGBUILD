# Maintainer: Yoel Lion <yoel3ster at gmail dot com>
# Contributor: adamruss
# last Maintainer: shulamy <shulamy at regba.org.il>
pkgname=mazrim2
pkgver=2.0
pkgrel=1
pkgdesc="A Utillity For Watching Stream Videos with mediaplayer - eng / heb gui"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mazrim/"
license=('GPL')
depends=('pythoncard2' 'vlc')
source=(http://downloads.sourceforge.net/sourceforge/mazrim/mazrim_$pkgver-1_all.deb)
md5sums=('dcfe823cdc684333581a9bcede5b97b6')

build() {
   ar x mazrim_$pkgver-1_all.deb
   mkdir -p mazrim
   tar xf data.tar.gz -C mazrim
   sed -i '3c exec python2 Mazrim.py' mazrim/usr/bin/mazrim
   cp -r mazrim/* $pkgdir
   rm -rf control.tar.gz data.tar.gz debian-binary
}
