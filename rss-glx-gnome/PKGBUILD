# Contributor: cdfk <cdfk1981-at-gmail.com>
pkgname=rss-glx-gnome
pkgver=0.9.0
pkgrel=1
pkgdesc="rss-glx screensaver for gnome"
arch=(i686 x86_64)
url="http://rss-glx.sourceforge.net/"
license=('GPL')
depends=(rss-glx)
source=()
md5sums=()

build() {
 mkdir -p $pkgdir/usr/lib/xscreensaver
 cd $pkgdir/usr/lib/xscreensaver
 pacman -Ql rss-glx | grep -o "/usr/bin/[a-zA-Z].*" > tmp 
 for i in `cat tmp`; do ln -s "$i" $(echo "$i" | sed 's/\/usr\/bin\///g') ; done 
 rm tmp 
 rm rss-glx_install.pl 
}

