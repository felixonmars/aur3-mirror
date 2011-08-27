# $Id$
# Contributor: kezar <kezar@inbox.com>

pkgname=mpdbrowser
pkgver=0.9.20
pkgrel=1
pkgdesc="MPD click & play client"
arch=('i686' 'x86_64')
url="http://mpdbrowser.tuxfamily.org/"
license=('GPL')
depends=('gtk2>=2.12.0' 'python2>=2.5.0' 'python-mpd')
source=(http://mpdbrowser.tuxfamily.org/mpdBrowser-$pkgver.tgz)
md5sums=('b943c16544e06b111f3cf548a5ab9373')

build() {
  cd $startdir/src/mpdBrowser-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}


