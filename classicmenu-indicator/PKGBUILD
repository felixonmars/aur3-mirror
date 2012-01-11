# Maintainer: crazyelf5

pkgname=classicmenu-indicator
pkgver=0.07
pkgrel=1
pkgdesc="An indicator that displays the main menu from Gnome2/Gnome Classic"
arch=('any')
url="http://www.florian-diesch.de/software/classicmenu-indicator"
license=('GPL')
depends=('python2' 'libappindicator' 'gnome-menus' 'pygtk' 'python2-gobject2' 'glib2')
source=($url/dist/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('af0834f4d4779c9d9273d33ba663ed8a'
         'd12a85264c53752daf4da3e783d1662e')

build() {
  cd $pkgname-$pkgver
  
  # Sed for Python2
  sed -e "s_env python_&2_;s_bin/python_&2_" \
      -i `egrep -rl "(env python|bin/python)" .`
      
  python2 ./setup.py install --root="$pkgdir/"
  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
