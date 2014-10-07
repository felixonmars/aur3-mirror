# Maintainer: mattia.b89 <mattia DOT b89 AT gmail DOT com>
# Contributor: acmps <acmps.pt@gmail.com>
# Contributor: Ner0

pkgname=transmageddon-git
pkgver=1.3+
pkgrel=1
pkgdesc="A video transcoder based on GStreamer"
arch=('any')
url="http://www.linuxrising.org"
license=('LGPL')
depends=('python-gobject' 'libnotify' 'gtk3' 'gst-plugins-base')
makedepends=('intltool' 'appdata-tools')
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'            
            'gst-libav: Extra media codecs'
            'gst-vaapi: Hardware accelerated video encode')
provides=('transmageddon')
conflicts=('transmageddon')
install=transmageddon.install
source=('git://git.gnome.org/transmageddon')
md5sums=('SKIP')

package() {
  cd "$srcdir/transmageddon"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  make DESTDIR="$pkgdir/" install
} 
