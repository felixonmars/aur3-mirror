# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Victor Temistocles Nardes <victor.tn@gmail.com>
_project=vamps
_file='qVamps (GUI)'

pkgname=qvamps
pkgver=0.98
pkgrel=2
pkgdesc="A Qt front-end for the vamps DVD backup tool"
arch=(i686)
url="http://vamps.sourceforge.net"
license=('GPL')
depends=('vamps' 'qt>=3.3.4' 'perl>=5.8.5' 'perlqt>=3.008' 'dvdauthor')
makedepends=('swig>=1.3.21')
source=("http://downloads.sourceforge.net/project/$_project/$_file/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('91b0ec57fc02c902082f2bd38d77527a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -i ../../Makefile.diff || return 1
  make || return 1
  install -m 755 -d $startdir/pkg/usr/bin
  make PREFIX=$startdir/pkg/usr install || return 1
}
