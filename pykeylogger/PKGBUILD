# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Laszlo Papp <djszapi2 at gmail com>

pkgname=pykeylogger
pkgver=1.2.1
pkgrel=3
pkgdesc="A simple keylogger written in python"
url="http://pykeylogger.sourceforge.net"
arch=('any')
license=('GPL')
depends=('python-imaging' 'python-configobj' 'pygtk' 'python-xlib' 'tk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-${pkgver}_src.zip
        $pkgname.patch)
install=$pkgname.install
md5sums=('45cf74c6f1440172f26d0015b01ef58a'
         '0b138c01b7f75ece853bba5787427cda')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np1 -i "$srcdir"/$pkgname.patch 

  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --prefix=/usr
  
  for i in *.py; do
    install -Dm755 "$i" "$pkgdir/usr/lib/python2.7/$i"
  done

  for i in Pmw/*; do
    install -Dm755 "$i" "$pkgdir/usr/lib/python2.7/$i"
  done

  for i in doc/*; do
    install -Dm755 "$i" "$pkgdir/usr/share/pykeylogger/$i"
  done

  install -Dm755 pykeylogger.ini "$pkgdir"/usr/share/pykeylogger/pykeylogger.ini
  install -Dm755 keylogger.pyw "$pkgdir"/usr/bin/pykeylogger
  install -Dm755 pykeylogger.val "$pkgdir"/usr/bin/pykeylogger.val

  rm "$pkgdir"/usr/{CHANGELOG.TXT,LICENSE.txt,README.txt,TODO.txt}
  mv "$pkgdir"/usr/pykeylogger* "$pkgdir"/usr/share/pykeylogger/
}
