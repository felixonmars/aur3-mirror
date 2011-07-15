# $Id: $
# Maintainer: Andriy Kovtun <kovtunos@yandex.ru>
# Contributor: Aaron, phrakture, Griffin <aaron@archlinux.org>
# Contributor: erkaN kaplaN <erkan@linux-sevenler.org>

pkgname=gwget-standalone
_pkgname=gwget
pkgver=1.0.4
pkgrel=3
pkgdesc="Gwget compiled without Epiphany dependencies"
arch=('i686' 'x86_64')
url="http://gnome.org/projects/gwget/index.html"
license=('GPL')
depends=('libgnomeui' 'libnotify' 'intltool')
conflicts=('gwget')
provides=('gwget')

install=gwget-standalone.install
source=(http://ftp.gnome.org/pub/GNOME/sources/gwget/1.0/gwget-$pkgver.tar.bz2
		libnotify-0.7.patch)
md5sums=('b65ebc752cad068e747ae6ef45fafdcc'
         '0a82f8650a9fecda5a80abbc6ae18312')

build() {
  cd $srcdir/gwget-$pkgver
  patch -Np0 -i ../libnotify-0.7.patch || return 1
		
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1;
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1

  install -dm755 $pkgdir/usr/share/gconf/schemas
  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/gwget.schemas \
    $pkgdir/etc/gconf/schemas/*.schemas
  rm -f $pkgdir/etc/gconf/schemas/*.schemas
}
