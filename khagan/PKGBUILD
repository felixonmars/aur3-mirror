# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=khagan
pkgver=0.1.2
pkgrel=1
pkgdesc="A live user interface builder for controling parameters via OSC."
arch=(i686 x86_64)
url="http://khagan.berlios.de/"
license=('GPL')
depends=('pyphat' 'pyxml')
install="$pkgname.install"
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('555fe8d08d5bb11695b02ebc471e7217'
         '6798d8ca165db86ec0d9ddf7403e7a27')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHON="python2"

  # Some fixes
  sed -e "167 i\\\\tdialog.connect(\"response\", lambda d, r: d.destroy())" \
      -e "s_python_env python2_" \
      -i $pkgname.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir/"

  # Replace bin
  mv "$pkgdir/usr/bin/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  # Install desktop and pixmap file
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 pixmaps/${pkgname}_icon_32px.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
