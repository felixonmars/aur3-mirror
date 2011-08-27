# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=pytivo-youtube-hg
pkgver=20090723
pkgrel=1
pkgdesc="Plugin for pyTivo that enables you to download Youtube videos straight from your TiVo."
arch=(i686 x86_64)
url="http://code.google.com/p/pytivoyoutubeplugin"
license=('GPL')
groups=()
depends=('ffmpeg' 'python' 'pytivo')
makedepends=('mercurial')
optdepends=()
provides=('pytivo-youtube')
conflicts=()
replaces=()
backup=()
source=()
options=()
install=
md5sums=()

_hgroot="https://pytivoyoutubeplugin.googlecode.com/hg/"
_hgname="hg"

build() {
  cd ${srcdir}

  msg "Connecting to googlecode.com HG server...."

  if [ -d ${srcdir}/$_hgname ] ; then
    cd $_hgname && hg pull
    msg "The local files are updated."
  else
    hg clone $_hgroot
  fi

  msg "HG checkout done."
  msg "Starting install..."

  cd ${srcdir}/$_hgname

  mkdir -p ${pkgdir}/usr/share/pyTivo/plugins/youtube
  cp -r source/plugins/youtube/* ${pkgdir}/usr/share/pyTivo/plugins/youtube
}
