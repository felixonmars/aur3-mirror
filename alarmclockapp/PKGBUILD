# Contributor Eric Herrera <eric.gnome@gmail.com>

pkgname=alarmclockapp
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple alarm clock applet for gnome-panel"
url="http://eric.ad-sistemas.com"
license="GPL"
source=(http://eric.ad-sistemas.com/$pkgname-$pkgver.tar.gz)
depends=('pygtk' 'gstreamer0.10' 'gstreamer0.10-python')
makedepends=('pkgconfig')
arch=(i686 x86_64)
md5sums=('09e46cd94dce45936efa0a003aae0710')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}
  
