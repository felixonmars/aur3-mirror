pkgname=ettercap_x64
pkgver=0.7.3
pkgrel=1
pkgdesc="Ettercap is a suite for man in the middle attacks on LAN. This is a patched version with dns support on x86_64."
arch=('x86_64')
url="http://ettercap.sourceforge.net/"
depends=()
depends=('libpcap>=0.8.1' 'libnet>=1.1.2.1' 'gtk2' 'pth' 'zlib' 'libtool' 'pcre' 'openssl' 'pkgconfig>=0.15.0' 'atk>=1.6.0' 'pango>=1.4.0' )
license=('GPL')
conflicts=('ettercap' 'ettercap-gtk')
provides=('ettercap' 'ettercap-gtk')
source=('http://sourceforge.net/projects/ettercap/files/ettercap/NG-0.7.3/ettercap-NG-0.7.3.tar.gz/download' 'ettercap-NG-0.7.3_x86_64.patch')
md5sums=('28fb15cd024162c55249888fe1b97820' '6a68053e20b431eabe50f529df390706')

build() {
  patch -p0 -i ettercap-NG-0.7.3_x86_64.patch
  cd "$srcdir/ettercap-NG-$pkgver"
  
  ./configure --prefix=/usr LDFLAGS=-pthread
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
