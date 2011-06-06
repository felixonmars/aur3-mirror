# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: farid abdelnour <farid at archlinux-br.org>

pkgname=vmpk
pkgver=0.4.0
pkgrel=2
pkgdesc="MIDI event generator and receiver"
arch=('i686' 'x86_64')
url="http://vmpk.sourceforge.net/"
license=('GPL3')
depends=('qt' 'jack')
makedepends=('cmake')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('bc54ac39fe02ce3cbed4b2b7f82cd70f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # prepare build dir
  [ -d build ] || mkdir build && cd build

  # build bins for jack net and alsa rtmidi drivers
  for _bin in JACK_-jack NET_-net ALSA_; do
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=release \
             -DRTMIDI_DRIVER=${_bin/_*} \
             -DENABLE_DBUS=1 \
             -DCMAKE_SKIP_RPATH=ON \
             -DPROGRAM_NAME=vmpk${_bin/*_}
    make
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  # install jack and net bins and desktop files
  for _bin in Jack_-jack Net_-net; do
    install -Dm755 src/$pkgname${_bin/*_} "$pkgdir/usr/bin/$pkgname${_bin/*_}"
    sed "s|VMPK|& ${_bin/_*}|;s|Exec.*|&${_bin/*_}|" ../$pkgname.desktop > \
      "$pkgdir/usr/share/applications/$pkgname${_bin/*_}.desktop"
  done
}
