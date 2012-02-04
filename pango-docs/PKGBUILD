# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
pkgname=pango-docs
pkgver=1.20.3
pkgrel=1
pkgdesc="Documentation for pango to be used in devhelp"
arch=(i686 x86_64)
url="http://library.gnome.org/devel/pango/stable/"
license=('GPL')
options=('docs')
install=pango-docs.install
source=(ftp://ftp.gnome.org/pub/gnome/sources/pango/1.20/pango-${pkgver}.tar.bz2)
md5sums=('a940442d56dc8820f561b90572ad467b')

build () {
  # Set destination dir
  _docdir=$pkgdir/usr/share/gtk-doc/html

  cd $srcdir/pango-$pkgver/
  ./configure --htmldir=/usr/share/gtk-doc/html

  cd docs
  make docs || return 1

	# Create destination dir
	install -d $_docdir/pango

	# Install documentation to destination
  install -D -m 644 $srcdir/pango-$pkgver/docs/html/* \
    $_docdir/pango
}

# vim:set ts=2 sw=2 et:
