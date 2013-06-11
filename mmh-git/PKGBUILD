# Maintainer: Army
_pkgname=mmh
pkgname=$_pkgname-git
pkgver=20130527.1232
pkgrel=1
pkgdesc="a mail client (MUA) for users who like the Unix philosophy"
arch=('i686' 'x86_64')
url="http://marmaro.de/prog/mmh"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=("$_pkgname" 'nmh')
conflicts=("$_pkgname" 'nmh')
replaces=('nmh')
source=("$_pkgname::git+http://git.marmaro.de/mmh")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/$_pkgname
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
