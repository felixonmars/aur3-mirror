# Contributor: Dan Serban

pkgname=nicoedit-bin
pkgver=2.4
pkgrel=1
pkgdesc="Fast, lightweight, feature-rich text editor made by the Puppy Linux developers"
arch=(i686)
url=http://code.google.com/p/puppy-development/downloads/list
license=(GPLv2)
depends=(glib2 glibc zlib libgee atk cairo fontconfig freetype2 gdk-pixbuf2 gtk2 gtksourceview2 pango)
source=("http://puppy-development.googlecode.com/files/nicoedit-2.4.pet")
md5sums=('ec529413ce9c378b00ea7568547d7c03')

build()
{
  mv usr "$pkgdir/"
  install -Dm755 /usr/lib/libgee.so.2.0.0 "$pkgdir/usr/lib/libgee.so.0"
}
