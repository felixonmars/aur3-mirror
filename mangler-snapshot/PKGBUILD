# Contributor: LinkMaster03 <linkmaster032000 the at symbol gmail.com>

pkgname=mangler-snapshot
pkgver=1.1.20100227
pkgrel=1
pkgdesc="Ventrilo compatible VOIP client for Linux (latest snapshot)"
arch=('i686' 'x86_64')
url="http://www.mangler.org/"
license=('GPLv3')
depends=('gtk2' 'gtkmm' 'speex' 'gsm' 'pulseaudio')
optdepends=('libmpdclient: Now Playing plugin with MPD support')
provides=()
conflicts=('mangler' 'mangler-svn')
source=('http://www.mangler.org/downloads/mangler-snapshot.tar.gz')
md5sums=('244c4bba6af8e49fe6f525f620d8ec78')

build() {
    cd $startdir/src/mangler-$pkgver

    touch configure
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
