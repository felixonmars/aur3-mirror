# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Adam <adam@russ.co.il>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=gnome-web-photo
pkgver=0.10.5
_pkgverminor=0.10
pkgrel=1
pkgdesc="a tool to generate full-size image files and thumbnails from HTML files and web pages"
url="http://git.gnome.org/browse/gnome-web-photo/"
license=("LGPL")
arch=('i686' 'x86_64')
depends=('libwebkit' 'gconf' 'pkg-config')
makedepends=('intltool>=0.35.0')
install="$pkgname.install"
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/$_pkgverminor/$pkgname-$pkgver.tar.xz")
md5sums=('d842a49a65853ef9b1e3e54f55752ba2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Thx to György Balló
  sed -e 's/--cflags-only-I libxul-unstable libxul/--cflags-only-I libxul/' \
      -i configure

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/bin \
    --with-gtk=2.0 \
    --disable-static \
    --disable-schemas-install \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
