# Maintainer: jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgname=jack1-git
_longname=jack-audio-connection-kit
pkgver=0.121.3.58.g5820385
pkgrel=1
pkgdesc="A low-latency audio server"
arch=('i686' 'x86_64')
url="http://jackaudio.org"
license=('GPL' 'LGPL')
depends=('libsamplerate' 'readline')
makedepends=('git' 'doxygen' 'libffado' 'celt')
optdepends=('libffado: FireWire support' 'celt: NetJACK driver')
provides=("jack=$pkgver" "$_longname=$pkgver")
conflicts=('jack' "$_longname")
replaces=('jack' "$_longname")
backup=(etc/security/limits.d/99-audio.conf)
options=('!libtool')
install="$pkgname.install"

source=("$pkgname::git://github.com/jackaudio/jack1.git"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git'
        "$pkgname.install"
	    '99-audio.conf'
        '40-hpet-permissions.rules')
md5sums=('SKIP' 'SKIP' 'SKIP'
         'c7a2d4f7dc96cd7cc38ffcef2da11d50'
         'ae65b7c9ebe0fff6c918ba9d97ae342d'
         '471aad533ff56c5d3cbbf65ce32cadef')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always | sed 's|-|.|g'
}

prepare()
{
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.tools/master.url "$srcdir/tools-git"
  git config submodule.example-clients/master.url "$srcdir/example-clients-git"
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  # configure realtime access/scheduling
  # see https://bugs.archlinux.org/task/26343
  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  # give the audio group access to the rtc and hpet devices
  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
}
# vim:set ts=2 sw=2 et:
