# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=libpurple-core-answerscripts-git
pkgver=20100609
pkgrel=1
pkgdesc="Framework for hooking scripts to respond received messages for various libpurple clients such as pidgin or finch"
arch=('x86_64' 'i686')
url="http://github.com/harvie/libpurple-core-answerscripts"
license=('GPL')
depends=('libpurple')
makedepends=('git')
source=()
md5sums=()

_gitroot='git://github.com/Harvie/libpurple-core-answerscripts.git'
_gitname="$pkgname"

build() {
  cd ${srcdir}/

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

	make || return 1
	make install PREFIX="$pkgdir/usr" || return 1
}
