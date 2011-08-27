# Maintainer: HazE <hansun.lee@gmail.com>
# Contributor: Jazzbug <yeonstyle@gmail.com>

pkgname=pidgin-nateon-svn
pkgver=147
pkgrel=4
pkgdesc="Pidgin-Nateon is a NateOn protocol for Pidgin"
arch=('i686' 'x86_64')
url="http://nateon.haz3.com"
group=('nateon')
license=('GPL')
depends=('pidgin')
source=('nateon-emote.tar.bz2')
md5sums=('8d924bedaf5cc056fac797a88dd9617b')

_svntrunk=http://dev.haz3.com/svn/nateon/trunk
_svnmod=pidgin-nateon

build() {
	cd $startdir/src
	svn co $_svntrunk $_svnmod -r $pkgver
	msg "SVN checkout done or the server timed out"
	msg "Starting make..."

	cd $_svnmod
	## 컴파일 에러 처리
	libtoolize --force --copy
	## 컴파일 시작
	./autogen.sh

	./configure --prefix=/usr || return 1
	make || return 1

	## 이모티콘 추가
	cp -R $srcdir/usr/ $startdir/pkg
	make DESTDIR=$startdir/pkg install
}
