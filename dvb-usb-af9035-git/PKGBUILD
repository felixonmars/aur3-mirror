# Maintainer: Davide Depau <david.dep,1996@gmail.com>
pkgname=dvb-usb-af9035-git
pkgver=20121217
pkgrel=3
pkgdesc="An open-source driver for DVB-T cards based on AF9035 chipset, like AverMedia A867/A865"
arch=('i686' 'x86_64')
url="http://www.linuxtv.org/wiki/index.php/DVB-T_USB_Devices"
license=('GPL2')
depends=('linux')
makedepends=('linux' 'linux-headers' 'patchutils' 'git' 'wget' 'perl-digest-sha1' 'perl-proc-processtable') #
optdepends=('kaffeine: watch TV with a DVB-T adapter'
'mythtv: an amazing media-center, which supports PVR'
'me-tv: simple app to watch DVB-T television'
'tvheadend: make a TV server (AUR)')
provides=('avermedia_a867')
conflicts=('avermedia_a867')
replaces=('avermedia_a867')
source=('Makefile.patch'
	'build.patch'
	'http://xgazza.altervista.org/Linux/DVB/dvb-usb-af9035-02.fw')
md5sums=('b5cd0dacb8230939f4bdbe5af6daf1af'
         'cf063f8c37f75db855d3e6f16a522822'
         'f71efe295151ba76cac2280680b69f3f')

_gitroot="git://linuxtv.org/media_build.git"
_gitname="media_build"

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname"

  msg "GIT checkout done or server timeout"
  msg "Starting install script ..."

  patch "$srcdir/$_gitname/build" < "$srcdir/build.patch"
  patch "$srcdir/$_gitname/v4l/Makefile" < "$srcdir/Makefile.patch"

  ./build "$pkgdir"
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  install -d $pkgdir/usr/lib/firmware
  install -D -m644 $srcdir/*.fw ${pkgdir}/lib/firmware
}