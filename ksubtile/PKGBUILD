# Contributor: Nicoco
 pkgname=ksubtile
 pkgver=1.3
 pkgrel=1
 pkgdesc="KDE subtitles editor"
 arch=(i686 x86_64)
 url="http://ksubtile.sourceforge.net/"
 license="GPL"
 depends=('kdelibs')
 source=(http://downloads.sourceforge.net/ksubtile/ksubtile-$pkgver.tar.bz2)
 md5sums=('51a37115d22ac4d178f019fae8d53c77')
 
 build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
    make || return 1
    make DESTDIR=$startdir/pkg install
 }
