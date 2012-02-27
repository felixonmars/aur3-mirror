# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor: Marcelo Cavalcante <marcelo@marcelocavalcante.net>
# Contributor: Jens Kleikamp <jens@codes-concepts.com>
# Contributor: Philipp Gildein <rmbl@openspeak-project.org>

pkgname=smuxi
pkgver=0.8.9.2
pkgrel=2
pkgdesc="The user-friendly and cross-platform IRC client for sophisticated users for GNOME/GTK+"
arch=('any')
url="http://www.smuxi.org/"
license=('GPL')
depends=('notify-sharp' 'libindicate' 'log4net' 'nini' 'stfl')
makedepends=('intltool')
source=(http://www.smuxi.org/jaws/data/files/$pkgname-$pkgver.tar.gz)
md5sums=('ed064fbaab6143e0d29d8f39e6ed333f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --enable-engine-irc \
              --enable-engine-xmpp \
              --enable-frontend-gnome \
              --enable-frontend-stfl \
              --with-notify \
              --with-indicate \
              --with-vendor-package-version="Arch Linux $pkgver-$pkgrel"
  LANG=en_US make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  mkdir -p $pkgdir/usr/share/indicators/messages/applications
  echo '/usr/share/applications/smuxi-frontend-gnome.desktop' > $pkgdir/usr/share/indicators/messages/applications/smuxi-frontend-gnome
}
