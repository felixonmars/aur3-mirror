# Maintainer:  TDY <tdy@gmx.com>
# Contributor: wain <wain@archlinux.fr>

pkgname=undvd
pkgver=0.7.5
pkgrel=1
pkgdesc="An easy interface to mencoder for ripping and encoding DVDs"
arch=('any')
url="http://sourceforge.net/projects/undvd/"
license=('GPL3')
depends=('mencoder' 'mplayer' 'perl>=5.8.8')
optdepends=('lsdvd:      faster DVD scanning'
            'libdvdcss:  encrypted DVD support'
            'mkvtoolnix: mkvmerge support'
            'ogmtools:   ogmmerge support'
            'vobcopy:    vobcopy support'
            'python:     codectest usage')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('93e51332e66eea7e2caef26b8cc7f68e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
