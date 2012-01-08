# Contributor: neolith
pkgname=yuuguu
pkgver=5626
pkgrel=2
pkgdesc="Yuuguu offers cross network instant messaging, instant screen sharing, real time collaboration, web conferencing and remote support."
arch=('i686' 'x86_64')
url="http://yuuguu.com"
license=('custom:Yuuguu User license')
depends=('java-runtime')
makedepends=('rpmextract')
md5sums=('4f6b28c43a199fc9b5eaff339e0b5fed'
         'ece9ab1401b19617be2ab0352c992a18')
_architect='i386'
[ "$CARCH" = "x86_64" ] && _architect='amd64'
[ "$CARCH" = "x86_64" ] && md5sums[0]='5a44cbc20cf35df06602a54537564ef2'

source=("yuuguu-latest-${_architect}.rpm::http://www.yuuguu.com/downloads/yuuguu-latest-${_architect}.rpm"
        'patch-yuuguu')
provides=("$pkgname=${pkgver}")
build() {
  cd $srcdir

  # extract the archive
  rpmextract.sh yuuguu-latest-${_architect}.rpm || return 1

  # apply java location fix  
  patch usr/bin/yuuguu patch-yuuguu

  mkdir -p pkg
  mv usr pkg

  cp -r pkg/usr $pkgdir || return 1

  install -D -m644 $srcdir/pkg/usr/share/doc/yuuguu/copyright $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
