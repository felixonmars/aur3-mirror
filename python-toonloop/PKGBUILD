# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgbasename=toonloop
pkgname=python-$_pkgbasename
pkgver=1.2.8
pkgrel=2
pkgdesc="Toonloop is a live stop motion animation software. Python version"
arch=('any')
url="http://toonloop.com/"
license=('GPL')
depends=('python2' 'pygtk' 'twisted' 
         'python-opengl' 'python-numeric'
         'python-pygame' 'pyliblo'
         'pyopenssl' 'python2-numpy'
         'hicolor-icon-theme')
conflicts=('toonloop<=1.2.8')
install=("$pkgname.install")
source=(http://bitbucket.org/aalex/${_pkgbasename}1/get/$pkgver.tar.gz)
md5sums=('dfa63b6b79d04a05f15f36d4efacb4cf')

build() {
  cd "$srcdir/${_pkgbasename}1"

  # Python2 fixes
  sed \
        -e "s_env python_&2_" \
        -e "s_bin/python_&2_" \
        -i `grep -rlE "(env python|bin/python)" .`

  # Build
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # Install
  sed \
	-e "s:$_pkgbasename:$pkgname:g" \
	-e "s:Toonloop:Python &:g" \
	-i $_pkgbasename.desktop

  mkdir -p "$pkgdir"/usr/share/{{doc,licenses}/"$pkgname",icons/hicolor/{48x48,scalable}/apps,man/man1/applications}

  install -Dm 644 "$_pkgbasename.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 644 doc/* "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$_pkgbasename.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm 644 "$_pkgbasename.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  mv "$pkgdir/usr/bin/$_pkgbasename" "$pkgdir/usr/bin/$pkgname"

  # Man file
  gzip -9 $_pkgbasename.1 && install -Dm644 $_pkgbasename.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
