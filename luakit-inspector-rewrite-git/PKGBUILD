# Maintainer: Jonny Gerold <jonny@fsk141.com>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>

pkgname=luakit-inspector-rewrite-git
pkgver=20111110
pkgrel=1
pkgdesc="A fast, small, webkit-gtk based browser extensible by Lua -- inspector rewrite branch"
arch=('i686' 'x86_64')
url="http://www.luakit.org/projects/luakit" 
license=('GPL3')
depends=('libwebkit' 'luafilesystem' 'libunique')
makedepends=('git' 'lua' 'help2man')
optdepends=('luajit2: Needed if use the luajit option in make')
source=($pkgname.install)
provides=(luakit)
conflicts=('luakit' 'luakit-develop-git' 'luakit-git')
install=$pkgname.install

md5sums=('90b1959aedd60c11cb79b926615a3553')

_gitroot="https://github.com/karottenreibe/luakit.git"
_gitname="inspector-rewrite"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
	cd $_gitname
    msg "Switching to inspector-rewrite branch"
    git checkout -b remotes/origin/inspector-rewrite
	git pull origin inspector-rewrite
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  makeopts="PREFIX=/usr DESTDIR="${pkgdir}" DEVELOPMENT_PATHS=0 "
# if you want to use luajit2, comment the above line and uncomment the following
# makeopts="PREFIX=/usr DESTDIR="${pkgdir}" DEVELOPMENT_PATHS=0 USE_LUAJIT=1"  
  make ${makeopts} all
  make ${makeopts} install

}
