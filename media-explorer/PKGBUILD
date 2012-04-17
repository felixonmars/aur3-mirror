# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jonathan Lestrelin <zanko@daemontux.org>

pkgname=media-explorer
pkgver=0.4.0
pkgrel=1
pkgdesc="A media centre application for Linux (including MeeGo)"
arch=('i686' 'x86_64')
url="http://media-explorer.github.com/"
license=('LGPL')
depends=('lirc-utils' 'mx>=1.3' 'hicolor-icon-theme' 'grilo-plugins'
         'gnome-desktop2' 'clutter-gst' 'libxtst' 'rest' 'libunwind'
         'desktop-file-utils')
makedepends=('gnome-common' 'intltool' 'gtk-doc' 'tracker' 'gssdp')
optdepends=('gnome-settings-daemon: media player keys support'
            'gnome-dvb-daemon: dvb support'
            'quvi: youtube plugin support'
            'gdata: youtube plugin support'
            'gupnp-av: upnp plugin support'
            'tracker: webremote and tracker plugin support')
provides=("mex=$pkgver")
conflicts=('mex' 'mex-git')
options=('!libtool' '!emptydirs')
install="$pkgname.install"
source=("https://github.com/media-explorer/$pkgname/tarball/$pkgver")
md5sums=('955c1c9f951ad824c378820b8cc0abc1')

build() {
  cd "$srcdir/$pkgname-$pkgname-"*

  ./autogen.sh --prefix=/usr \
               --libexecdir=/usr/bin \
               --sysconfdir=/etc \
               --enable-displayconf=yes \
               --enable-networks=yes \
               --enable-lirc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-"*
  make DESTDIR="$pkgdir/" install
}
