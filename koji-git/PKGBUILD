# Maintainer: David Roheim <david.roheim@gmail.com>

pkgname=koji-git
pkgver=1.9.0.r104.g631f8cc
pkgrel=1
pkgdesc='Koji is a system for building and tracking RPMS. This base package contains shared libraries and the command-line interface.'
arch=('any')
license=('GPL2' 'LGPL2.1')
url=('https://fedorahosted.org/koji/')

depends=('python2-krbv' 'python2-pyopenssl' 'urlgrabber' 'rpm-org')
makedepends=('python2')

source=('makefile_python_to_python2.patch')
sha256sums=('f1bc4f65f4f7be2615336ce0e5d2fd728f6af2b6cd12f4d40ee59d204fa5ca9c')

_gitroot='git://git.fedorahosted.org/git/koji'
_gitname='koji'

pkgver() {
#  cd "$srcdir/$_gitname"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed -r 's/^koji\.//g'
}

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    git reset && git checkout .
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  patch -p1 < ../makefile_python_to_python2.patch || return $?
}

package() {
	cd $srcdir/$_gitname/koji/
	make DESTDIR=$pkgdir install
}
