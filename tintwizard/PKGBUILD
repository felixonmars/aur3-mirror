# Maintainer: SpepS < dreamspepser at yahoo dot it >
# Contributor: nTia89 <tia.tif@hotmail.it>

pkgname=tintwizard
pkgver=0.3.4
pkgrel=2
pkgdesc="A GUI wizard which generates config files for tint2 panels."
arch=('any')
url="http://code.google.com/p/tintwizard/"
license=('GPL3')
depends=('python2' 'pygtk' 'tint2')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
install="$pkgname.install"
md5sums=('1bc8dc416623510e813a28b88e04ff2b'
         '68cf81e496c141df52d539c83ece6254')

build() {

  cd "$srcdir"

  # Python2 fix
  sed -i "s_python_&2_" $pkgname.py

  # Install
  mkdir -p "$pkgdir"/usr/{bin,share/applications}
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications"
}
