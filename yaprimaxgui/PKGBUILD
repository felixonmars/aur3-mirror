# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=yaprimaxgui
pkgver=3.1.2
pkgrel=1
pkgdesc="Yet Another Primax GUI"
arch=(i686)
url="http://ornellas.apanela.com/dokuwiki/software:yaprimaxgui"
license=('GPL')
groups=()
depends=('tk')
optdepends=('primax_scan: one of the backends (http://primax.sourceforge.net)' 'pxscan: the other possible backend (http://home2.swipnet.se/~w-25069/pxscan.html')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://ornellas.apanela.com/dokuwiki/_media/software:$pkgname-$pkgver.tar.gz?id=software%3Ayaprimaxgui&cache=cache")
noextract=()
md5sums=('c6a6c0f4bd26b69250bbc72ab9a4c09a')

build() {
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/yaprimaxGUI-$pkgver/yaprimaxgui $pkgdir/usr/bin 
}

# vim:set ts=2 sw=2 et:
