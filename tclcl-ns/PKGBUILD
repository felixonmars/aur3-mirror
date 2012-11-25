# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

# basically the same as the tclcl package available in the AUR,
# but ns (2.35) now needs tcl/tk 8.5 (currently available through
# archlinux official packages), but the otcl in the AUR needs
# tcl/tk 8.4. Hence, there is now otcl-ns, linked against tcl/tk
# 8.5, and tclcl-ns, linked against otcl-ns

pkgname=tclcl-ns
_pkgname=tclcl
pkgver=1.20
pkgrel=1
pkgdesc="TclCL (Tcl with classes) is a Tcl/C++ interface"
url="http://otcl-tclcl.sourceforge.net/tclcl/"
license='MIT'
depends=('gcc-libs')
makedepends=('otcl-ns')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/otcl-tclcl/tclcl-src-$pkgver.tar.gz)
md5sums=('91d48d6694ae06cd29c627df6b78534a')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=$startdir/pkg/usr/lib/tclcl || return 1
  make || return 1
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -d $startdir/pkg/usr/lib/tclcl
  install -d $startdir/pkg/usr/lib/tclcl/bin
  install -d $startdir/pkg/usr/lib/tclcl/include
  install -d $startdir/pkg/usr/lib/tclcl/lib
  make install || return 1
  ln -s bin/tcl2c++ $startdir/pkg/usr/lib/tclcl/tcl2c++
}
