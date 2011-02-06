# $Id: PKGBUILD,v 1.5 2006/09/07 20:37:43 andyrtr Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=xmms-ladspa
orgname=xmms_ladspa
pkgver=1.1
pkgrel=2
pkgdesc="An Effect-Plugin for XMMS that provides the power of the LADSPA API to XMMS"
arch=(i686 x86_64)
url="http://www.ecs.soton.ac.uk/~njl98r/code/audio/"
license=('GPL')
depends=('xmms' 'ladspa' 'cmt' 'swh-plugins' 'liblrdf' 'gtk')
groups=('xmms-plugins' 'xmms-effect-plugins')

source=(http://www.ecs.soton.ac.uk/~njl98r/code/audio/source/$orgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$orgname-$pkgver
  mkdir -p $startdir/pkg/usr/lib/xmms/Effect
  make || return 1
  cp ladspa.so $startdir/pkg/usr/lib/xmms/Effect
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
md5sums=('5f14d62145188d38008c4e30194916e6')
