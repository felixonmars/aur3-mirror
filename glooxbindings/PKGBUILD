# $Id: PKGBUILD,v 1.8 2008/01/16 17:52:33 sergej Exp $
# Maintainer: Sergej Pupykin <sergej@aur.archlinux.org>
# Maintainer: William Rea <sillywilly@gmail.com>

pkgname=glooxbindings
pkgver=0.1.5
pkgrel=1
pkgdesc="Python and Lua bindings for gloox library"
arch=(i686 x86_64)
url="http://camaya.net/glooxbindings"
options=('!libtool')
license=("GPL")
depends=('python' 'gloox')
source=(http://camaya.net/download/$pkgname-$pkgver.tar.bz2)
md5sums=('b8ce5fc2f58d387d2a495d82639b426a')

build() {
  cd $startdir/src/glooxbindings-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
