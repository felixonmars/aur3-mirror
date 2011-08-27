# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=libxpnet
#Anyone has better idea for versioning?
pkgver=2.0.0.7
pkgrel=1
pkgdesc="small HTTP and FTP downloading library for C++ (static build)"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/projects/xpnet/"
license=('MPL' 'GPL' 'LGPL')
depends=()
#Anyone has better idea from where I can download library without rest of ff?
source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}-source.tar.bz2)
md5sums=('ec14cf833d75d07190c4095345d688bd')

build() {
    cd $startdir/src/mozilla/xpinstall/wizard/libxpnet/src || return 1
    for i in nsSocket nsFTPConn nsHTTPConn
    do
	g++ -O2 -D__unix__ -c ${i}.cpp -o ${i}.o || return 1
	install -D -m u=rw,go=r ${i}.h ${startdir}/pkg/usr/include/${i}.h || return 1
    done
    ar cr libxpnet.a nsSocket.o nsFTPConn.o nsHTTPConn.o || return 1
    install -D -m u=rw,go=r libxpnet.a ${startdir}/pkg/usr/lib/libxpnet.a || return 1
}
