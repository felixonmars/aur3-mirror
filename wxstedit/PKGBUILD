# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=wxStEdit
pkgname=wxstedit
pkgver=1.2.5
pkgrel=1
pkgdesc="A library and sample program for the wxWidgets's wxStyledTextCtrl wrapper around the Scintilla text editor widget."
arch=(i686 x86_64)
url="http://wxcode.sourceforge.net/showcomp.php?name=wxStEdit"
license=('custom:wxWindows')
depends=('wxgtk')
source=("http://downloads.sourceforge.net/project/wxcode/Components/$_pkg/$pkgname-$pkgver.tar.gz")
md5sums=('8ba50bdd40b1a0b43643de8f40e0ea0d')

build() {
  # creating needed setup.h header
  cd "$srcdir/$pkgname/include/wx/stedit"
  cp setup0.h setup.h && cd ../../..

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  # install sample application
  install -Dm755 "samples/stedit/$pkgname" \
                 "$pkgdir/usr/bin/$pkgname"

  # install custom wxWindows license file
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/licenses/wxgtk/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
