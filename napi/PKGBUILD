# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Maintainer: thc_flow <nospam@weedsmoker.im>

pkgname=napi
pkgdesc="script which download subtitles for movies"
pkgver=0.16.3.1
pkgrel=3
arch=('any')
url="http://napi.py.googlepages.com/"
source=('http://napi.py.googlepages.com/napi.py' thc.patch)
license=()
depends=('python2' 'p7zip')

build() { 
    cd $srcdir
    patch napi.py thc.patch
    install -D -m755 napi.py $pkgdir/usr/bin/napi	 
}

md5sums=('0d32feaa99b8aa81f9c8e60f9fc71de6'
         '16faca95717f11f815ea3b9b2012b13d')
