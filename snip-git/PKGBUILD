# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=snip-git
pkgver=20090912
pkgrel=1
pkgdesc="Snip: A lightweight snippets expander"
arch=('i686' 'x86_64')
url="http://github.com/Dieterbe/snip/"
license=('GPL3')
depends=('dmenu' 'xdotool' 'zenity')
makedepends=('git')
provides=('snip')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/snip.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

	make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

