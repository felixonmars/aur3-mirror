# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=notalon
pkgver=0.5.0
pkgrel=2
pkgdesc="Note-taking, simplified"
arch=('any')
url="http://notalon.org/"
license=('MIT')
depends=('wxpython>=2.8.10.1' 'python-reportlab')
install=notalon.install
source=(http://bitbucket.org/saketh/notalon/downloads/Notalon-$pkgver.zip
        setup.py.patch
        notalon.py.patch
        notalon.desktop
        notalon.png)
md5sums=('66a6f159380fffe1244a3b938749b7e1'
         '023dab9d6944eb9ccc8c7d4dbb5fa492'
         'c765d2c90b9dfe3a2be9703022441b1c'
         '5cf4535181b2e1ed31bf918dfe82a2bd'
         'a40c2c9b4f32fd3aa7c2e4ed5b6114b8')

build() {
  cd "$srcdir/Notalon-$pkgver"

  # Remove execute bit from all files
  find "$srcdir/Notalon-$pkgver" -type f -exec chmod -x {} +

  patch -p0 -i "$srcdir/setup.py.patch"
  patch -p0 -i "$srcdir/notalon.py.patch"

  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1

  # Menu entry and icon
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # License
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
