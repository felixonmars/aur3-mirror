# Contributor: Josh Harding <theamigo@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=vncrec-twibright
pkgver=0.2
pkgrel=1
pkgdesc="saves/replays datastream from an rfb(VNC) server to a file or stdout"
arch=('i686', 'x86_64')
url="http://ronja.twibright.com/utils/vncrec/"
license=('GPL')
depends=(libxaw)
makedepends=(imake)
provides=(vncrec)
source=('patchfile.patch' "http://ronja.twibright.com/utils/vncrec-twibright.tgz")
md5sums=('15992538036fe2446b4c75db2fb68a73' 'cd9f277c70157816e807a4754470139f')

build() {
  cd "$startdir/src/vncrec-twibright"
  patch -Np0 -i ../../patchfile.patch || return 1
  xmkmf || return 1
  make World || return 1
  mkdir -p "$startdir/pkg/usr/bin/" "$startdir/pkg/usr/share/doc/$pkgname/"
  install -m755 -t "$startdir/pkg/usr/bin/" vncrec/vncrec || return 1
  install -m644 -t "$startdir/pkg/usr/share/doc/$pkgname/" README || return 1
}
