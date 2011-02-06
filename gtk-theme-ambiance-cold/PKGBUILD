# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gtk-theme-ambiance-cold
pkgver=0.1.6.5
pkgrel=1
pkgdesc="Colder blue version of the new Ubuntu theme Ambiance, as well a green Mint version."
arch=(any)
url="http://gnome-look.org/content/show.php/Ambiance+Cold?content=121118"
license=('CCPL')
depends=('gtk-engine-murrine-git')
source=(http://gnome-look.org/CONTENT/content-files/121118-AmbianceCold-20100515.tar.gz)
md5sums=('ffa22748a035137b3ec4575822563c7b')

build() {
  mkdir -p $pkgdir/usr/share/themes/
}

package() {
  cd "$srcdir"
  cp -R $srcdir/Ambiance\ Cold $pkgdir/usr/share/themes/
}

# vim:set ts=2 sw=2 et:
