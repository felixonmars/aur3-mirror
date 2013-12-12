# Maintainer: Dave Reisner <d@falconindy.com> 
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=omega-revived-git
pkgver=0.91
pkgrel=4
pkgdesc="A roguelike game based on Omega 0.91 originally by the Laurence Brothers in the late 80's"
arch=('i686' 'x86_64')
url="https://github.com/Lyle-Tafoya/Omega-Revived.git"
license=('GPL2')
depends=('ncurses')
makedepends=('git')
conflicts=('omega-revived')
provides=('omega-revived')

source=("$pkgname"::'git://github.com/Lyle-Tafoya/Omega-Revived.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/build/unix/"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cd "$srcdir/$pkgname/build/unix/"
  chmod 4711 omega-revived
  mv omega-revived $pkgdir/usr/bin/
  chmod 0644 data/help*.txt data/license.txt data/motd.txt data/thanks.txt data/update.txt
  chmod 0600 data/abyss.txt data/scroll[1234].txt data/*.dat
  chmod 0600 data/omega.hi data/omega.log
  mkdir -p $pkgdir/usr/lib/omega_revived
  mv data/* $pkgdir/usr/lib/omega_revived/
}

