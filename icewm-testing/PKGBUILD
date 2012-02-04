# Maintainer:  tri <trile7 at gmail dot com>

pkgname=icewm-testing
_pkgname=icewm
pkgver=1.3.7
pkgrel=4
pkgdesc="A Window Manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="http://www.icewm.org/"
license=('LGPL')
provides=('icewm')
conflicts=('icewm' 'icewm-cvs')
depends=('gcc-libs' 'libxrandr' 'libxft' 'libsm' 'libxinerama' 'gdk-pixbuf2')
source=(http://downloads.sourceforge.net/project/$_pkgname/$_pkgname-1.3/$pkgver/$_pkgname-$pkgver.tar.gz $_pkgname.desktop)
md5sums=('224695231aedb2b91db3254a13e1c8dd'
         'a3ed467f0199792205b04272402a9945')

build() {
   cd ${srcdir}/$_pkgname-$pkgver || return 1
   ./configure --prefix=/usr --sysconfdir=/etc
   make
   make DESTDIR=${pkgdir} install install-man install-docs
   install -D -m644 ${srcdir}/icewm.desktop ${pkgdir}/etc/X11/sessions/$_pkgname.desktop
}

