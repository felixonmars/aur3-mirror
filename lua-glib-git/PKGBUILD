# Maintainer: mimas <mimasgpc@free.fr>

pkgname=lua-glib-git
pkgver=41.bc73904
pkgrel=1
pkgdesc="Lua binding for glib 2."
arch=('i686' 'x86_64')
url="https://bitbucket.org/darktjm/lua-glib"
license=('custom:Apache-2.0')
makedepends=('git')
depends=('lua' 'glib2')
source=("git+https://bitbucket.org/darktjm/lua-glib.git")
md5sums=('SKIP')

_gitname="lua-glib"

pkgver() {
	cd "$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$_gitname"
	gcc $CFLAGS -fPIC `pkg-config glib-2.0 lua --cflags --libs` -shared -o glib.so lua-glib.c
}

package() {
	cd "$_gitname"
	install -Dm755 glib.so "$pkgdir/usr/lib/lua/5.2/glib.so"
}
