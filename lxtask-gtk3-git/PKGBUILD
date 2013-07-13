# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=lxtask
pkgname="$_gitname"-gtk3-git
pkgver=20130712
pkgrel=1
pkgdesc="Task manager and system monitor of LXDE"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('lxde-git')
depends=('libx11' 'gtk3')
makedepends=('autoconf' 'automake' 'libtool' 'intltool' 'git')
optdepends=(lxsession-lite)
provides=('lxtask')
conflicts=('lxtask')
url="http://lxde.org/"
source=(git://lxde.git.sourceforge.net/gitroot/lxde/lxtask)
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$_gitname
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
	cd $srcdir/$_gitname

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk3
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

