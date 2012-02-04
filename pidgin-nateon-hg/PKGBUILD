# Maintainer: HazE <hansun.lee@gmail.com>
# Contributor: Jazzbug <yeonstyle@gmail.com>

pkgname=pidgin-nateon-hg
pkgver=1
pkgrel=1
pkgdesc="Pidgin-Nateon is a NateOn protocol for Pidgin"
arch=('i686' 'x86_64')
url="http://nateon.haz3.com"
group=('nateon')
license=('GPL')
depends=('pidgin')
source=('nateon-emote.tar.bz2')
md5sums=('8d924bedaf5cc056fac797a88dd9617b')
provides=('pidgin-nateon')
_hgroot="https://bitbucket.org/jonypoins"
_hgrepo="pidgin-nateon-aug2011"

build() {
        cd "$srcdir"
        msg "Connecting to Mercurial server...."

        if [ -d $_hgrepo ] ; then
          cd $_hgrepo
          hg pull -u
          msg "The local files are updated."
        else
          hg clone --insecure $_hgroot $_hgrepo
          cd "$_hgrepo"
        fi
	
        msg "Mercurial checkout done or server timeout"
        msg "Starting make..."
	
	
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

