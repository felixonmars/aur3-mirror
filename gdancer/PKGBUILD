# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
#Contributor:Tutku Dalmaz <tutkudalmaz@gmail.com>
pkgname=gdancer
pkgver=0.4.6
pkgrel=1
pkgdesc="GDancer is a visualization plugin for XMMS"
url="http://figz.com/gdancer/"
licence="GPL"
depends=('gtk' 'xmms' 'glib')
source=("http://freshmeat.net/redir/gdancer/3115/url_tgz/$pkgname-$pkgver.tar.gz")
md5sums=('0d58d5b2eed0df93d5654919d8bc35c0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}

