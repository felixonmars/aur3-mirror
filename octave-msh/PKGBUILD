#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=msh
pkgname=octave-$_pack
pkgver=1.0.10
pkgrel=1
pkgdesc="Create and manage triangular and tetrahedral meshes for Finite Element or Finite Volume PDE solvers. Use a mesh data structure compatible with PDEtool. Rely on gmsh for unstructured mesh generation."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL')
groups=('octave-forge')
depends=('octave>=3.0' 'octave-splines')
makedepends=()
# Note that dolfin-git does not currently build due to missing dependencies.
optdepends=('gmsh>=1.6.5' 'awk' 'dolfin-git')
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
md5sums=('a7cddc41148d8456b46bc84f98284629')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
