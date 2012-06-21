# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=stardict-hg
pkgver=585
pkgrel=1
pkgdesc="International dictionary software"
arch=('i686' 'x86_64')
license=('GPL')
depends=('espeak' 'libsigc++' 'enchant' 'gtk2' 'libsm')
makedepends=('mercurial' 'popt' 'intltool' 'gnome-doc-utils' 'gnome-common')
url="http://www.stardict.org/"
provides=('stardict')
conflicts=('stardict')
options=('!libtool' '!emptydirs')
source=(stardict-zlib.patch)
md5sums=('19af8ed357036c5e9848836399272926')

_root="https://stardict-3.googlecode.com/hg/"
_repo="stardict"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_repo ] ; then
    cd $_repo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_root $_repo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_repo-build
  cp -r $srcdir/$_repo $srcdir/$_repo-build
  cd $srcdir/$_repo-build

  LDFLAGS="${LDFLAGS} -lgmodule-2.0"
  patch -Np1 -i $srcdir/stardict-zlib.patch
  ./autogen.sh \
    --prefix=/usr \
    --disable-gnome-support \
    --disable-schemas-install \
    --disable-festival \
    --disable-qqwry \
    --disable-updateinfo \
    --disable-gucharmap \
    --disable-static \
    --disable-tools
  make
}

package() {
  cd $srcdir/$_repo-build
  make DESTDIR=$pkgdir install
}
