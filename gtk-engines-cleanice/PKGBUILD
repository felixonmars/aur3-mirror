# Contributor: Marc St-Laurent <mstlaurent@canada.com>
pkgname=gtk-engines-cleanice
pkgver=2.4.1
pkgrel=2
pkgdesc="The CleanIce GTK+ engine"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/elysium-project/"
license=('GPL')
depends=('gtk2>=2.6')
source=(http://downloads.sourceforge.net/elysium-project/$pkgname-$pkgver.tar.gz
        gtkrc-Clean-Curve
        gtkrc-CleanIce
        gtkrc-CleanIce-Dark
        gtkrc-CleanIce-Gorilla
        gtkrc-CleanIce-Vanilla)
md5sums=('bc9d3eb31671f6918666d0a58f64d1ae'
         'c037a4dd292219f1a01da555ac31d3cf'
         '8d6b9c847c67918ff04c7c5598e47738'
         '4847425aac624b89f7a74bfc7fee2bef'
         '8f7443c6ce607e641abc08c8a180d4f2'
         '1356730d2d7d29a4b1d0cd7b69e71efd')
options=(!libtool)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install

  # install themes
  for theme in Clean-Curve CleanIce CleanIce-Dark CleanIce-Gorilla CleanIce-Vanilla
  do
    install -d -m 755 $pkgdir/usr/share/themes/$theme/gtk-2.0
    install -m 644 "$srcdir/gtkrc-$theme" $pkgdir/usr/share/themes/$theme/gtk-2.0/gtkrc
  done
}

