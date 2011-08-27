# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
#Contributor:Tutku Dalmaz <tutkudalmaz@gmail.com>
pkgname=xmms-nebulus
pkgver=0.7.0
pkgrel=1
pkgdesc="Nebulus is an OpenGL/SDL visualization plugin for XMMS."
url="http://nebulus.tuxfamily.org"
licence="GPL"
depends=('gtk' 'xmms' 'sdl_ttf' 'glib')
source=("http://freshmeat.net/redir/xmms-nebulus/29699/url_bz2/$pkgname-$pkgver.tar.bz2")
md5sums=('16d1b6bf109a64f231f84aea5c7b0975')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}

