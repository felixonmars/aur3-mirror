# Maintainer: justzx <justzx2011@gmail.com>
#	      lvzongting <lvzongting@gmail.com>
pkgname=openyoudao
#true && pkgname=('openyoudao-gtk2')
pkgver=beta0.3
pkgrel=1
pkgdesc="a dict client of youdao  for linux"
arch=('x86_64' 'i686')
url="http://www.openyoudao.org/"
license=('MIT')
depends=('python2' 'xclip' 'curl'  'python2-xlib' 'python2-lxml'  'pywebkitgtk' 'python2-beautifulsoup3')
install="openyoudao.install"
source=("https://github.com/justzx2011/openyoudao/tarball/$pkgver")
md5sums=('a27e258c95805caa2484bd07226a039e')
package() {
  cd ${srcdir}/justzx2011-openyoudao-*/
  #LICENSE
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/openyoudao/LICENSE"
  # bin
  install -Dm755 scripts/openyoudao \
    "$pkgdir/usr/bin/openyoudao"
  # libs
  install -d "$pkgdir/usr/lib/openyoudao"
  install -Dm644 ./*.py \
    "$pkgdir/usr/lib/openyoudao"
  # cache
  install -d "$pkgdir/usr/share/openyoudao"
  cp -rf cache/* "$pkgdir/usr/share/openyoudao/."
  chmod -R 755 "$pkgdir/usr/share/openyoudao"
  # desktop file
  install -Dm644 desktop/openyoudao.desktop \
    "$pkgdir/usr/share/applications/openyoudao.desktop"
}
