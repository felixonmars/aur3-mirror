# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=guitarix-webui
pkgver=0.28.3
pkgrel=1
pkgdesc="A web frontend for Guitarix."
arch=('any')
url="http://guitarix.sourceforge.net/"
license=('GPL')
depends=('guitarix' 'python2-numpy')
install="$pkgname.install"
source=("http://download.sourceforge.net/project/guitarix/guitarix/$pkgname-$pkgver.tar.bz2"
        start_guitarix_{engine,webui})
md5sums=('2e5f12a5ea4cc2df3018607299435b0b'
         '305fa4029ad7d263705ad377ce09cb60'
         '4ba1b78f0130376a3f5ba19e91c166eb')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  sed -i '1s/env python/&2/' `find . -name "*.py"`
}

package() {
  cd $pkgname-$pkgver


  # web server and ui
  install -d "$pkgdir/usr/lib/python2.7/site-packages/$pkgname"
  cp -a webui websockify "$pkgdir/usr/lib/python2.7/site-packages/$pkgname"

  # doc
  install -Dm644 README-dist.txt "$pkgdir/usr/share/doc/$pkgname/README"

  # start scripts
  install -d "$pkgdir/usr/bin"
  install -Dm755 ../${source[1]} "$pkgdir/usr/bin"
  install -Dm755 ../${source[2]} "$pkgdir/usr/bin"
}
