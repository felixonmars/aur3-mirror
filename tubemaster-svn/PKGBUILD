# Maintainer: TDY <tdy@archlinux.info>

pkgname=tubemaster-svn
pkgver=6
pkgrel=1
pkgdesc="A YouTube video downloader (forked from QtTube)"
arch=('any')
url="http://tubemaster.googlecode.com/"
license=('GPL')
depends=('ffmpeg>=0.4.9' 'python2-pyqt4' 'youtube-dl>=2008.11.01')
makedepends=('subversion')
provides=('tubemaster')
conflicts=('tubemaster')
source=($pkgname::svn+http://tubemaster.googlecode.com/svn/trunk
        setup.py)
sha256sums=('SKIP'
            'fe93a2bb89d5981d58809cbe90d14a825118c9f1086c2141a910e0a08cd5e252')

pkgver() {
  cd "$srcdir/$pkgname"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/$pkgname"
  ln -sf "$srcdir/setup.py" .
  install -m755 src/${pkgname/-*}.py src/${pkgname/-*}
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 data/${pkgname/-*}.desktop \
    "$pkgdir/usr/share/applications/${pkgname/-*}.desktop"
}

# vim:set ts=2 sw=2 et:
