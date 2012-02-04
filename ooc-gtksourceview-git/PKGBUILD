# Contributor: Scott Olson <scott@scott-olson.org>

pkgname=ooc-gtksourceview-git
pkgdesc="ooc lang files for gtksourceview"
url="http://github.com/nddrylliog/ooc-gtksourceview"
license=('LGPL')
arch=('i686' 'x86_64')
pkgver=20100201
pkgrel=1
depends=('gtksourceview2' 'shared-mime-info')
makedepends=('git')

_gitroot='git://github.com/nddrylliog/ooc-gtksourceview.git'
_gitname='ooc-gtksourceview'
_gitbranch='master'

build() {
  cd "$srcdir"
	
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
  else
	git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout. Preparing sources..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  msg "Starting make..."
  cd ${srcdir}/${_gitname}-build

  install -Dm755 ooc.lang $pkgdir/usr/share/gtksourceview-2.0/language-specs/ooc.lang
}

