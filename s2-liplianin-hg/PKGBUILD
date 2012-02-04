# Maintainer: Markus Opitz <mastero23 at gmail dot com>
# Contributor: Matias Korhonen <webadmin@draco-vulgaris.net>

pkgname=s2-liplianin-hg
pkgver=15391
pkgrel=1
pkgdesc="DVB drivers for Linux"
arch=('i686' 'x86_64')
url="http://mercurial.intuxication.org/hg/s2-liplianin"
license=('GPL3')
makedepends=('mercurial' 'kernel26-headers>=2.6.38', 'kernel26-headers<2.6.39')
provides=('s2-liplianin')
install="s2-liplianin-hg.install"
md5sums=('4c5dc464b57c997c25dbf40c652a1776')

_hgroot="http://mercurial.intuxication.org/hg/"
_hgrepo="s2-liplianin"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  sed -i 's|/sbin/lsmod|/bin/lsmod|g' v4l/Makefile
  make
}

package ()
{
  cd "$srcdir/$_hgrepo-build"
  sed -i '/\/sbin\/depmod -a/d' v4l/Makefile.media
  make DESTDIR="$pkgdir/" KDIR26="/lib/modules/$(uname -r)/updates/kernel/drivers/media" media-install
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}
