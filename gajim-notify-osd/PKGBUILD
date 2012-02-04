# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=gajim-notify-osd
_pkgname=gajim
pkgver=0.12.5
pkgrel=1
pkgdesc="Jabber client written in PyGTK"
arch=(i686 x86_64)
url="http://www.gajim.org/"
license=('GPL')
depends=('gtkspell' 'sqlite3' 'dnsutils' 'pygtk' 'libxss' 'python>=2.5')
makedepends=('gettext' 'perlxml' 'dbus' 'intltool')
optdepends=('dbus-python')
provides=('gajim')
replaces=('gajim')
options=(!libtool)
source=(http://www.gajim.org/downloads/$_pkgname-$pkgver.tar.gz \
        'osd.patch')
md5sums=('13068d441bd2090c18543ccdb95ef439'
         '183e6a75713affb226c23dc8860b2539')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  patch -Np0 -i ${srcdir}/osd.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cd $startdir/pkg/usr/share/$_pkgname/
  find . -name "*.pyo" | xargs rm -rf
}
