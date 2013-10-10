# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: helios
# Maintainer: Christoph Vigano <mail@cvigano.de>
pkgname=nagstamon-git
pkgver=0.9.11.r3.gf5ec619
pkgrel=1
epoch=1
pkgdesc="Nagios status monitor for the desktop"
arch=('any')
url="http://nagstamon.ifw-dresden.de/"
license=('GPL')
depends=('python2' 'pygtk' 'gnome-python-extras' 'python2-lxml' 'python2-rsvg' 'python2-distribute')
makedepends=('git')
provides=('nagstamon')
conflicts=('nagstamon')
replaces=('nagstamon-svn')

_gitname=Nagstamon

source=("$_gitname::git://github.com/HenriWahl/$_gitname.git"
        "nagstamon.desktop"
        "nagstamon-autostart.desktop"
        "nagstamon-noti.patch")

pkgver() {
  cd $_gitname
  git describe --tags --long | sed -E 's/v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname/$_gitname"

  patch -Np0 -i "$srcdir/nagstamon-noti.patch"
  python2 setup.py install --optimize=1 --prefix=/usr --root="$pkgdir"

  install -Dm644 "$srcdir/nagstamon.desktop" "$pkgdir/usr/share/applications/nagstamon.desktop"
  install -Dm644 "$srcdir/nagstamon-autostart.desktop" "$pkgdir/etc/xdg/autostart/nagstamon.desktop"
  ln -s /usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' $pkgdir/usr/bin/nagstamon.py
}

md5sums=('SKIP'
         'cbb32d63215d2dbe4dee3ce89caa0b15'
         '9449c9c67a156d209675fef133fe576b'
         'a5a1e72daff5459cd886e8097be33919')

# vim:set ts=2 sw=2 et:
