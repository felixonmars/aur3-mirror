# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
pkgname=gtksourceview2-docs
pkgver=2.2.1
pkgrel=1
pkgdesc="Documentation for gtksourceview2 to be used in devhelp"
arch=(i686 x86_64)
url="http://library.gnome.org/devel/gtksourceview-2.0/stable/"
license=('GPL')
options=('docs')
install=gtksourceview2-docs.install
source=(ftp://ftp.gnome.org/pub/gnome/sources/gtksourceview/2.2/gtksourceview-${pkgver}.tar.bz2)
md5sums=('1c5bd86f854ead3aedb96463ebbb275f')

build () {
  # Set destination dir
  _docdir=$pkgdir/usr/share/gtk-doc/html

  cd $srcdir/gtksourceview-$pkgver/
  ./configure --htmldir=/usr/share/gtk-doc/html --prefix=/usr
  make || return 1

  cd docs/reference
  make docs || return 1

	# Create destination dir
	install -d $_docdir/gtksourceview-2.0

	# Install documentation to destination
  install -D -m 644 $srcdir/gtksourceview-$pkgver/docs/reference/html/* \
    $_docdir/gtksourceview-2.0
}

# vim:set ts=2 sw=2 et:
