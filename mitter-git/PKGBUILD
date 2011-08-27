# Contributor: sweston <contact at samuelweston dot com>

pkgname=mitter-git
pkgver=20100212
pkgrel=1
pkgdesc="Micro-blogging client with multiple interfaces. Git version."
arch=('i686' 'x86_64')
url="http://mitter.googlecode.com/"
license=('GPL3')
depends=(python)
makedepends=(git)
optdepends=(gtk2: GUI Support)
provides=(mitter)
conflicts=(mitter mitter-alpha)
source=()
md5sums=()

_gitroot="git://gitorious.org/mitter/mainline.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  python setup.py install --root="$pkgdir" || return 1
  install -D -m644 "mitter.desktop" \
  	"${pkgdir}/usr/share/applications/mitter.desktop"
  
}

