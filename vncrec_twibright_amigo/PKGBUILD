# Contributor: Josh Harding <theamigo@gmail.com>
pkgname=vncrec_twibright_amigo
pkgver=0.2
pkgrel=2
pkgdesc="saves/replays datastream from an rfb(VNC) server to a file or stdout"
arch=('i686' 'x86_64')
url="http://ronja.twibright.com/utils/vncrec/"
license=('GPL')
depends=(libxaw)
makedepends=(imake)
provides=(vncrec)
source=('patchfile.patch' "http://ronja.twibright.com/utils/vncrec-twibright.tgz")
md5sums=('51abe263f4a72e4842b731d0175baf25' 'cd9f277c70157816e807a4754470139f')

build() {
  cd "$srcdir/vncrec-twibright"
  patch -Np0 -i ../../patchfile.patch || return 1
  xmkmf || return 1
  make World || return 1
}

package() {
  cd "$srcdir/vncrec-twibright"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/doc/$pkgname/"
  install -m755 -t "$pkgdir/usr/bin/" vncrec/vncrec || return 1
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" README || return 1
}
