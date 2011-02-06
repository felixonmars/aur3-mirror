# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgname=pygtk
pkgname=$_pkgname-1.2
pkgver=0.6.12
pkgrel=1
pkgdesc="Python bindings for the GTK 1.2 widget set"
arch=(i686 x86_64)
url="http://www.pygtk.org/"
license=('GPL')
depends=('imlib' 'libglade-old')
options=('!libtool')
source=("http://ftp.gtk.org/pub/gtk/python/v1.2/$_pkgname-$pkgver.tar.gz")
md5sums=('31f0991a18708d47fa29583c0ad956f6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Python2 Fixes
  export PYTHON="python2"
  export ac_cv_path_PYTHON="python2"
  sed -i "s|\(env python\).*|\12|;s|\(bin/python\).*|\12|" \
    `grep -Erl "(env python|bin/python)" .`

  # Fix reserved word var name
  sed -i "s|as,|ar,|g" gtk.py

  # Replace old regex with re
  sed -i "s|regex|re|g" pyglade/xmlparse.py

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Let live with pygtk 2
  rm "$pkgdir/usr/lib/python2.7/site-packages/"pygtk.*
}

# vim:set ts=2 sw=2 et:
