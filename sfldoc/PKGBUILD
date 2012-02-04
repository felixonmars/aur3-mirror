# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=sfldoc
pkgver=2.1
pkgrel=1
pkgdesc="the imatix standard function library documentation"
arch=('i686')
url="http://legacy.imatix.com/html/sfl/sfl.htm"
license=('custom')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://legacy.imatix.com/pub/sfl/doc/${pkgname}21.tgz")
noextract=()
md5sums=(171a65fb7cab9f41acc853fd44c7ed3c) #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/doc/sfl
  for i in `ls` ; do install -m 644 -T $i $pkgdir/usr/share/doc/sfl/$i; done

  
  
}

# vim:set ts=2 sw=2 et:
