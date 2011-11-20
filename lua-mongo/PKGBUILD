# Contributor: Kun Wang <ifreedom.dot.cn.at.gmail.dot.com>

pkgname=lua-mongo
pkgver=20111120
pkgrel=1
pkgdesc="Lua driver for mongodb"
arch=('i686' 'x86_64')
# groups=('')
url="https://github.com/moai/luamongo"
license=('MIT')
depends=('boost' 'mongodb')
makedepends=('git')
# conflicts=('')
# provides=('')
# replaces=('')
options=('!libtool')
source=(diff.patch)
md5sums=('009aa158578ce80c9b88c8aeb97607ef')

_gitroot="git://github.com/moai/luamongo.git"
_gitname="luamongo"
_build_dir="$srcdir/$_gitname-build"

prepare_build_dir() {
  cd "$srcdir"

  if [ $NOEXTRACT -eq 0 ]; then
	  msg "Connecting to GIT server...."
	  if [ -d $_gitname ] ; then
		  cd $_gitname && git pull origin
		  msg "The local files are updated."
		  cd "$srcdir"
	  else
		  git clone $_gitroot $_gitname
	  fi

	  msg "GIT checkout done or server timeout"
  fi

  rm -rf "$_build_dir"
  git clone "$_gitname" "$_build_dir"
}

build() {
  prepare_build_dir
  cd "$_build_dir"
  msg "Building..."

  patch -p1 <../diff.patch
  make || return 1
}

package(){
  cd "$_build_dir"

  mkdir -p "$pkgdir/usr/lib/lua/5.1"
  cp mongo.so "$pkgdir/usr/lib/lua/5.1/"

  rm -rf "$_build_dir"
}
