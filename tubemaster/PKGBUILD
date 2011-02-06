# Maintainer: TDY <tdy@gmx.com>

pkgname=tubemaster
pkgver=0.2a
pkgrel=1
pkgdesc="A YouTube video downloader (forked from QtTube)"
arch=('i686' 'x86_64')
url="http://tubemaster.googlecode.com/"
license=('GPL')
depends=('ffmpeg>=0.4.9' 'pyqt4' 'youtube-dl>=2008.11.01')
source=(http://$pkgname.googlecode.com/files/$pkgname-v$pkgver.tar.gz
        setup.py)
md5sums=('c583f7b00e0fc6c60242a62489266a43'
         '68a0c21cf51de512aaed5e962415a1fa')

build() {
  cd "$srcdir/$pkgname"
  ln -sf ../setup.py .
  install -m755 src/$pkgname.py src/$pkgname
  python setup.py build || return 1
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 data/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
