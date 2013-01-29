# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=twitux
pkgver=0.69
pkgrel=5
pkgdesc="A GTK+ Twitter client"
arch=('i686' 'x86_64')
url="http://live.gnome.org/DanielMorales/Twitux"
license=('GPL')
depends=('gconf>=1.2.0' 'libsexy' 'libcanberra' 'libsoup' 'libnotify' 'hicolor-icon-theme')
makedepends=('gnome-doc-utils>=0.3.2' 'intltool>=0.35.0'
             'libgnome-keyring' 'dbus' 'enchant' 'iso-codes')
optdepends=('libgnome-keyring'
            'dbus'
            'enchant: spell checking'
            'iso-codes: spell checking')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop
        $pkgname-$pkgver-notify.diff
        $pkgname-$pkgver-avatar.diff)
sha256sums=('374f429b248f2aaa42d55676a6524644df29893981c7481442663ae63ba97cf0'
            '325e5822552f5f0589ae79fda0f11ff45b09c3be54ef3da5d609f8e8dac625dd'
            'e4c5c6548687059ce3fb303668155baf0ec9e2ebb22b15dfcfedb19fc8744841'
            '6f49f5c56fbad4ea2e48fd5d82470fc70a518fdee33b9dcdbbd6b9a30568150b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -i ../$pkgname-$pkgver-avatar.diff
  patch -Np1 -i ../$pkgname-$pkgver-notify.diff

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-dbus=yes \
    --enable-spell=yes \
    ENCHANT_CFLAGS="$(pkg-config --cflags enchant)" \
    ENCHANT_LIBS="$(pkg-config --libs enchant)" \
    --enable-gnome-keyring=yes \
    GNOME_KEYRING_CFLAGS="$(pkg-config --cflags gnome-keyring-1)" \
    GNOME_KEYRING_LIBS="$(pkg-config --libs gnome-keyring-1)"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
