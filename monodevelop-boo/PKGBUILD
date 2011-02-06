# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Ulf Winkelvos <uwinkelvos(at)gmx(dot)de>
pkgname=monodevelop-boo
pkgver=2.4
pkgrel=1
pkgdesc="Boo language support for monodevelop"
arch=('i686' 'x86_64')
url="http://monodevelop.com"
license=('GPL')
groups=()
depends=('gtk-sharp-2' 'monodevelop>=2.2' 'mono-addins>=0.4' 'boo')
makedepends=('mono')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.novell.com/pub/mono/sources/$pkgname/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('aca5bd7ee104bc8dfd84df285fa2a3c7')



build() {
#  export MONO_SHARED_DIR="$startdir/src/.wabi"
#  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"

  #patch -i $srcdir/*.dpatch -p1

  ./configure --prefix=/usr --config=RELEASE
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
