# Contributor: Asparagus Maximus <asparagus.maximus () gmail () com>

pkgname=kismet-git
pkgver=20120723
pkgrel=1
pkgdesc="802.11 layer2 wireless network detector, sniffer, and intrusion detection system"
arch=(i686 x86_64)
license=('GPL2')
makedepends=('git')
depends=('libcap' 'libnl' 'pcre' 'ncurses' 'libpcap>=1.0.0' 'bluez' 'openssl')
optdepends=('gpsd: log coordinates of detected networks'
            'wireshark-cli: provide OUI files used to determine device manufacturer'
            'wireshark-cli: mergecap, to merge multiple capture files'
            'sox: provide the default kismet sound playback binary'
            'festival: text-to-speech support'
            'flite:  alternative/lightweight text-to-speech support'
            'mac80211-driver: full rfmon support'
            'ruby: ruby interface')
url="http://www.kismetwireless.net/"
backup=('etc/kismet.conf' 'etc/kismet_drone.conf')
install=kismet.install
conflicts=('kismet')
provides=('kismet')
source=()
md5sums=("ff8f52b45cd06cf207facae2e11c9637")

_gitroot="https://www.kismetwireless.net/kismet.git"
_gitname="kismet"

build() {
  cd "$srcdir"
  msg "Connecting to kismetwireless.net GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  
  ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var
  make dep
  make || return 1

  make plugins
  ./configure --prefix=/usr --sysconfdir=/etc 
  make || return 1
  
}

package() {
  cd "$srcdir/$_gitname-build"

  # Install kismet
  make DESTDIR="$pkgdir" install

  # Install plugins
  make plugins-install DESTDIR="$pkgdir"

  # the README is very comprehensive, a good idea to include it
  install -D -m 644 "${srcdir}/$_gitname-build/README" "${pkgdir}/usr/share/kismet/README"

  # Our own suid-install, first half (see kismet.install)
  install -o "root" -g "root" -m 4550 kismet_capture "${pkgdir}/usr/bin/"
  
  rm -rf "$srcdir/$_gitname-build"
}
