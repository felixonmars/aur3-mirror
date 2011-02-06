# Maintainer: Calvin Morrison <mutantturkey@gmail.com>
# Contributor:  Dannny <danny.a95@gmail.com>

pkgname=mt-git
pkgver=20100425
pkgrel=1
pkgdesc="mt - multi term, a minimal GTK and VTE based terminal aiming to be clean and concise"
arch=('any')
url="http://github.com/mutantturkey/mt/"
license=('GPL' 'MIT/X')
depends=('gtk2' 'vte')
makedepends=('git')
provides=('mt')
conflicts=('mt')

_gitroot=git://github.com/mutantturkey/mt.git
_gitname=mt

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
