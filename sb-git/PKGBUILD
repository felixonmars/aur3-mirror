# Maintainer: Calvin Morrison <mutantturkey@gmail.com>
# Contributor:  Dannny <danny.a95@gmail.com>

pkgname=sb-git
pkgver=20100506
pkgrel=1
pkgdesc="sb - a simple tabbed webkit browser, aims to suckless, while still being a full featured browser for the modern desktop."
arch=('i686' 'x86_64')
url="http://github.com/mutantturkey/sb/"
license=('GPL' 'MIT/X')
depends=('gtk2' 'libwebkit' 'dmenu-vertical' 'moreutils')
makedepends=('git')
provides=('sb')
conflicts=('sb')

_gitroot=git://github.com/mutantturkey/sb.git
_gitname=sb

build() {
  cd $srcdir

  msg "connecting to github's GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"

  cd "$srcdir/$_gitname"
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}
