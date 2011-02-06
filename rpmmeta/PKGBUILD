# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
pkgname=rpmmeta
pkgver=0.1
pkgrel=1
pkgdesc="RPM meta information extractor"
url="http://aur.archlinux.org/"
license=('GPL')
depends=('python')
makedepends=('zip')
arch=('i686' 'x86_64')

source=(\
  rpmmeta.tar.bz2
)

build()
{
  mkdir -p "$startdir/pkg/usr/bin" || return 1
  cd $startdir/src/ || return 1
  make || return 1
  install -m 755 rpmmeta $startdir/pkg/usr/bin || return 1
}

md5sums=('28523357931c83c961ced3d37dffae8e')
