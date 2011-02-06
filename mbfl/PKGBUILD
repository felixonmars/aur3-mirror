# Contributor: LTSmash <lord.ltsmash@gmail.com>
pkgname=mbfl
pkgver=1.1.4
pkgrel=1
pkgdesc="Marco's Bash Functions Library is a library of functions for the GNU bash shell, intended to be sourced by scripts at runtime."
arch=(i686 x86_64)
url="https://gna.org/projects/mbfl/"
license=('LGPL')
depends=(bash)
install="mbfl.install"
source=(http://download.gna.org/mbfl/$pkgver/$pkgname'_'$pkgver'_'src.tar.gz)
md5sums=('9c6e0656499a775af79c03bcaf58e929')

build() {
  cd "$srcdir/$pkgname"_"$pkgver"
  ./configure --prefix=/usr
  
  #Workaround bug which doen't lets make finish (not finding mbfl-config)
  cp ../../patch.diff scripts/patch.diff
  cd scripts/
  patch < patch.diff
  chmod +x mbfl-config
  alias mbfl-config="$srcdir/$pkgname_$pkgver/scripts/mbfl-config"
  cd ..
  #Done
  
  #Installing
  make all || return 1
  make INSTALL_ROOT="$pkgdir" install
} 
