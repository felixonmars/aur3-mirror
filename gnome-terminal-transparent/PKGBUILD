# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

pkgname=gnome-terminal-transparent
_realname=gnome-terminal
pkgver=3.16.0
pkgrel=1
pkgdesc="The GNOME Terminal Emulator - Applied patch to allow transparent background"
arch=(i686 x86_64)
license=(GPL)
provides=('gnome-terminal')
conflicts=('gnome-terminal')
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(gnome-doc-utils intltool itstool docbook-xsl desktop-file-utils
             libnautilus-extension appdata-tools gnome-shell gconf vala)
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal-transparent.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_realname/${pkgver:0:4}/$_realname-$pkgver.tar.xz
        'gnome-terminal-restore-transparency.patch')
sha256sums=('2d633017a0eba202a99ab4c3dda4b502d6750fb2471f6a60c53433a23be67fe8'
	    '00e8e84d6f348bfb4ac3c63c4971f4f1da1d603ca32deed45d8586f4aac73e1c')

prepare() {
  cd $_realname-$pkgver
  patch -Np1 -i ../gnome-terminal-restore-transparency.patch
}

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --with-nautilus-extension
  make
}

check() {
  cd $_realname-$pkgver
  make check
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
