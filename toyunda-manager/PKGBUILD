# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laurent Prevost <laurent.prevost@gmail.com>
pkgname=toyunda-manager
pkgver=2
pkgrel=1
pkgdesc="Manager for mplayer-toyunda"
arch=(i686 x86_64)
url="http://decideur.info/toyunda/"
license=('GPL')
groups=()
depends=('deb2targz' 'ruby' 'ruby-gtk2' 'ruby-libglade' 'mplayer-toyunda')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://decideur.info/toyunda/toyundaManager2.deb)
noextract=(toyundaManager2.deb)
md5sums=(e37cc8de234aa8d2305bf5c5776ecde1) #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  deb2targz "toyundaManager2.deb"
  tar -xvvzf toyundaManager2.tar.gz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
