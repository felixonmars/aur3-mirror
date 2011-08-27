# Contributor: Kun Wang <ifreedom.dot.cn.at.gmail.dot.com>
pkgname=lua-xmlrpc
pkgver=20101123
pkgrel=1
pkgdesc="lua-xmlrpc is a library to make remote procedure calls through XML-RPC using lua."
arch="any"
url="https://github.com/timn/lua-xmlrpc"
license=('MIT')
depends=('lua' 'luasocket' 'luaexpat')
makedepends=('git')
#provides=('lua-xmlrpc')

_gitroot="$url.git"
_gitname="lua-xmlrpc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Installing..."

  #
  # BUILD HERE
  #

  cd "$srcdir/$_gitname"
	mkdir -p $pkgdir/usr/share/lua/5.1/xmlrpc
	install -Dm0664 src/* \
		$pkgdir/usr/share/lua/5.1/xmlrpc
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -Dm0664 doc/* \
		$pkgdir/usr/share/doc/$pkgname
} 
