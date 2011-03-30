# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=gobby-dev
pkgver=0.4.94
pkgrel=1
pkgdesc="A free collaborative editor supporting multiple documents in one session and a multi-user chat"
arch=('i686' 'x86_64')
url="http://gobby.0x539.de"
license=('GPL')
depends=('libinfinity>=0.4.0' 'intltool' 'glibmm' 'gtkmm' 'gtksourceview2' 'libxml++' 'libsigc++2.0')
optdepends=('avahi: zeroconf support'
            'gtk2: gtk support')
makedepends=('gtk-doc'
             'pkgconfig')
provides=('gobby=0.4.93')
source=("http://releases.0x539.de/gobby/gobby-${pkgver}.tar.gz")
md5sums=('899d68ebe1af67c5a45b49328b86e23e')

build() {
  cd ${srcdir}/gobby-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
