# Maintainer: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
 
pkgname=adeskbar
pkgver=0.4.2
pkgrel=4
pkgdesc="A Quick Application Launcher"
arch=('any')
url="http://www.ad-comp.be/index.php?category/ADesk-Bar"
license=('GPL3')
depends=('pyxdg' 'pycairo' 'gnome-menus' 'pygtk')
optdepends=('python-xlib: Systray plugin'
            'python-wnck: Intellihide mode and tasklist plugin')
conflicts=("$pkgname-bzr" "$pkgname-archbang")
install="$pkgname.install"
source=("http://www.ad-comp.be/public/projets/ADeskBar/adeskbar-0.4.2.tar.bz2")
md5sums=('b64d714401d0d9c9321c28fc8ceae31d')
 
build() {
 
  cd "$srcdir/$pkgname"

  # Python2 fix
  sed -i "s_bin/python_&2_" `grep -rl bin/python .`

  # .desktop fix
  sed -i '$d' $pkgname.desktop

  # Install
  install -d "$pkgdir"/usr/{bin,share/{"$pkgname",pixmaps,applications}}
  cp -a src/* "$pkgdir/usr/share/$pkgname"
  install -m644 "src/images/$pkgname.png" "$pkgdir/usr/share/pixmaps/"
  install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"

  ln -s /usr/share/$pkgname/main.py $pkgdir/usr/bin/adeskbar
}