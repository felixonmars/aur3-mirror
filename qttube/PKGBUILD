# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Joerie de Gram <j.de.gram@gmail.com>

pkgname=qttube
pkgver=0.1
pkgrel=1
pkgdesc="A YouTube video downloader"
arch=('i686')
url="https://launchpad.net/qttube/"
license=('GPL')
depends=('hicolor-icon-theme' 'pyqt' 'youtube-dl>=2007.03.27')
install=qttube.install
source=(https://launchpad.net/$pkgname/0.x/$pkgver/+download/QtTube-$pkgver.tar.gz
        setup.py)
md5sums=('b889040afa659f9a9bdfe24a1e3d2ac8'
         'ad4ad733f999235b3b31a700582ccc34')

build() {
  cd "$srcdir/QtTube"
  sed -i '/Exec=/ s/$/.py/' data/$pkgname.desktop
  ln -sf ../setup.py .
  python setup.py build || return 1
}

package() {
  cd "$srcdir/QtTube"
  python setup.py install --prefix=/usr --root="$pkgdir"
  for _res in 16x16 24x24 32x32 48x48; do
    install -Dm644 data/$pkgname-$_res.png \
      "$pkgdir/usr/share/icons/hicolor/$_res/apps/$pkgname.png"
  done
}
