# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
 
pkgname=adeskbar
pkgver=0.5.1
pkgrel=2
pkgdesc="A quick and lightweight application launcher."
arch=('any')
url="http://adeskbar.tuxfamily.org/"
license=('GPL3')
depends=('python2-xdg' 'gnome-menus' 'pygtk')
optdepends=('python-xlib: systray plugin'
            'python2-wnck: intellihide mode and tasklist plugin'
            'python-pyalsaaudio: volume plugin'
            'python2-pyinotify: menu plugin'
            'vte: terminal plugin')
install="$pkgname.install"
source=("http://download.tuxfamily.org/$pkgname/sources/$pkgname-$pkgver.tar.gz"
        "$pkgname.sh")
md5sums=('99fba38f2e8675b369e784ba0ee20d1d'
         '58cc954001b1c4ed33ed758337e05e78')
 
build() {
  cd "$srcdir/$pkgname-${pkgver%.*}"

  # .desktop fix
  sed -i '$d' $pkgname.desktop
}

package() {
  cd "$srcdir/$pkgname-${pkgver%.*}"

  # data
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
  sed -i "s|env python$|&2|" `grep -rl "env python" "$pkgdir"`
}
