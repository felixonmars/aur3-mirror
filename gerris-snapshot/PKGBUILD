# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gerris-snapshot
pkgver=131206
pkgrel=1
pkgdesc="A generic tool for the numerical simulation of fluid flows."
arch=(i686 x86_64)
url="http://gfs.sourceforge.net/wiki/index.php/Main_Page"
license=('GPL')
groups=('gerris')
depends=('python2' 'gts-snapshot' 'netcdf' 'gsl' 'ode' 'openmpi'
         'fftw' 'proj' 'hicolor-icon-theme' 'shared-mime-info')
provides=('gerris')
conflicts=('gerris')
install="$pkgname.install"
source=("http://gerris.dalembert.upmc.fr/gerris/$pkgname.tar.gz")
md5sums=('SKIP')

pkgver() {
  ls -d $pkgname-* | cut -d"-" -f3
}

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  sed -i "s/python/&2/" doc/examples/gfs2doc.in
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
