# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
 
pkgname=adeskbar
pkgver=0.4.3
pkgrel=1
pkgdesc="A quick and lightweight application launcher."
arch=('any')
url="http://adeskbar.tuxfamily.org/"
license=('GPL3')
depends=('pyxdg' 'gnome-menus' 'pygtk')
optdepends=('python-xlib: systray plugin'
            'python-wnck: intellihide mode and tasklist plugin'
            'python-pyalsaaudio: volume plugin'
            'pyinotify: menu plugin'
            'vte: terminal plugin')
conflicts=("$pkgname-bzr" "$pkgname-archbang")
install="$pkgname.install"
source=("http://download.tuxfamily.org/$pkgname/sources/$pkgname-$pkgver.tar.bz2"
        "$pkgname-escape.patch")
md5sums=('255cd98ada4057e333a7c9069245eb88'
         '39265cc022a513ab1f1f8b98dbd74f0e')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fix
  sed -i "s|\(bin/python\).*|\12|" `grep -rl bin/python .`

  # .desktop fix
  sed -i '$d' $pkgname.desktop

  # patch to let menu plugin from load
  # when handling & < > etc
  patch -p1 -i ../$pkgname-escape.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a src/* "$pkgdir/usr/share/$pkgname"

  # icon
  install -Dm644 "src/images/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # desktop file
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # launcher
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/main.py" "$pkgdir/usr/bin/adeskbar"
}
