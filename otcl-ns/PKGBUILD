# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

# basically the same as the otcl package available in the AUR,
# but ns (2.35) now needs tcl/tk 8.5 (currently available through
# archlinux official packages), but the otcl in the AUR needs
# tcl/tk 8.4

pkgname=otcl-ns
_pkgname=otcl
pkgver=1.14
pkgrel=1
pkgdesc="An extension to Tcl/Tk for object-oriented programming"
url="http://otcl-tclcl.sourceforge.net/otcl/"
license='MIT'
depends=('glibc' 'tcl' 'tk' 'libxext')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
install=
source=(http://downloads.sourceforge.net/otcl-tclcl/otcl-src-$pkgver.tar.gz)
md5sums=('336ec1e0049d2546fb2362005c3bb0be')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=$startdir/pkg/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
