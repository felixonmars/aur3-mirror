# contributor: tantalum <tantalum at online dot de>
pkgname=guile-inotify
pkgver=1
pkgrel=1
pkgdesc='guile bindings for inotify'
arch=(any)
license=(GPL3)
makedepends=(git make)
depends=(guile 'linux>=2.6.13')
url=http://project.sph-info.eu/projects/guile-inotify

_giturl="git://sph-info.eu/guile-inotify"

build() {
  cd $srcdir
  msg "connecting to git server"

  if [[ -d $srcdir/$pkgname ]] ; then
    cd $pkgname && git pull origin
  else
    git clone $_giturl
  fi

  msg "git clone done"

  build=$srcdir/$pkgname-build
  rm -rf $build
  git clone $srcdir/$pkgname $build
  cd $build

  msg "starting build"

  make
}

package() {
  build=$srcdir/$pkgname-build
  cd $build
  sh setup.sh $pkgdir/usr
  rm -rf $build
}
