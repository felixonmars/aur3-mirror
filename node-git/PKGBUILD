pkgname=node-git
pkgver=20091022
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (git)'
arch=(i686 x86_64)
license=('custom:nodejs')
url="http://www.nodejs.org"
depends=('coreutils')
makedepends=('git' 'python')

_gitroot="git://github.com/ry/node.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  ./configure --prefix=/usr || return 1
  make || return 1
  tools/waf-light install --destdir=$pkgdir || return 1
}
