# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
 
pkgname=adeskbar
pkgver=0.5
pkgrel=1
pkgdesc="A quick and lightweight application launcher."
arch=('any')
url="http://adeskbar.tuxfamily.org/"
license=('GPL3')
depends=('pyxdg' 'gnome-menus2' 'pygtk')
optdepends=('python-xlib: systray plugin'
            'python-wnck: intellihide mode and tasklist plugin'
            'python-pyalsaaudio: volume plugin'
            'python2-pyinotify: menu plugin'
            'vte: terminal plugin')
conflicts=("$pkgname-bzr" "$pkgname-archbang")
install="$pkgname.install"
source=("http://download.tuxfamily.org/$pkgname/sources/$pkgname-$pkgver.tar.bz2"
        "$pkgname-escape.patch" "$pkgname.sh")
md5sums=('df12efb1f97c4c45fb90e5e03e693b54'
         '39265cc022a513ab1f1f8b98dbd74f0e'
         '58cc954001b1c4ed33ed758337e05e78')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"

  # .desktop fix
  sed -i '$d' $pkgname.desktop

  # patch to let menu plugin load
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
  install -Dm755 ../adeskbar.sh "$pkgdir/usr/bin/adeskbar"

  # python2 fix
  sed -i "s|bin/python$|&2|" `grep -rl bin/python "$pkgdir"`
}
