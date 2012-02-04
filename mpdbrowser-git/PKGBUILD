# $Id$
# Contributor: kezar <kezar@inbox.com>
# Maintainer: kezar <kezar@inbox.com>

pkgname=mpdbrowser-git
pkgver=20100309
pkgrel=1
pkgdesc="MPD click & play client (development version)"
arch=('i686' 'x86_64')
url="http://www.gnomefiles.org/app.php/mpdBrowser"
license=('GPL')
depends=('gtk2>=2.12.0' 'python>=2.5.0' 'mpd' 'python-mpd' 'git')
source=()
md5sums=()

build() {
  git clone git://git.tuxfamily.org/gitroot/mpdbrowser/mpdbrowser.git
  cd $startdir/src/mpdbrowser
  python setup.py install --prefix=/usr --root=$startdir/pkg
}

