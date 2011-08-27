# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_moonblade.dot.org>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=ja2-svn
pkgver=7059
pkgrel=1
pkgdesc="A port of Jagged Alliance 2 to SDL"
arch=('i686' 'x86_64')
url="http://tron.homeunix.org/ja2/"
license=('custom')
depends=('gcc-libs' 'sdl')
install=ja2.install
source=('ja2.png' 'ja2.desktop')
provides=('ja2')
conflicts=('ja2')
md5sums=('e793ae54bbe8874efc9205280281454f'
         '1f438b07138232399a493db93a02cae9')

_svnmod="ja2"
_svntrunk="svn://tron.homeunix.org/ja2/trunk"

build() {

  cd ${srcdir}

  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
  (cd ${_svnmod} && svn up -r $pkgver)
  else
  svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  # make and install
  export LNG=ENGLISH
  make || return 1
  make \
    PREFIX="$pkgdir"/usr \
    MANPREFIX="$pkgdir"/usr/share \
  install || return 1

  # remove .ico file
  rm -f "$pkgdir"/usr/share/pixmaps/jagged2.ico
  rm -f "$pkgdir"/usr/share/applications/ja2-stracciatella.desktop

  # install license
  install -Dm644 "SFI Source Code license agreement.txt" \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  # install icon
  install -Dm644 ../ja2.png "$pkgdir"/usr/share/pixmaps/ja2.png
  install -Dm644 ../ja2.desktop "$pkgdir"/usr/share/applications/ja2.desktop
}
