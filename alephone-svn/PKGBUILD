# Maintainer: Marcin Skory <armitage at gfreedom dot org>
pkgname=alephone-svn
pkgver=4697
pkgrel=1
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software (SVN version)'
arch=('i686' 'x86_64')
url="http://marathon.sourceforge.net/"
license=('GPL3')
depends=('sdl_ttf' 'libmad' 'libsndfile' 'libvorbis' 'mesa' 'sdl_image' 'sdl_net' 'smpeg' 'speex' 'zziplib')
makedepends=('subversion' 'boost' 'lua>=5.1')
optdepends=('alephone-emr: community-made scenario' \
            'alephone-eternalx: community-made scenario' \
            'alephone-evil: community-made scenario' \
            'alephone-marathon: M1A1 data converted for AlephOne' \
            'alephone-marathon2: original data for Marathon 2: Durandal' \
            'alephone-infinity: original data for Marathon Infinity' \
            'alephone-red: community-made scenario' \
            'alephone-rubiconx: community-made scenario' \
            'alephone-tempus_irae: community-made scenario')
provides=('alephone')
conflicts=('alephone')

_svntrunk=https://marathon.svn.sourceforge.net/svnroot/marathon/trunk
_svnmod=marathon

build() {
  cd "$srcdir"
  # forcing to ignore externals during checkout due to someone's bright idea to
  # bundle all the scenarios plus hi-res textures with the source tree; we have
  # separate packages for that and right now ignoring it doesn't seem to break
  # anything (at least not yet)
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up --ignore-externals -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ --ignore-externals -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Build procedure
  ./autogen.sh
  sed "s/PACKAGE='AlephOne'/PACKAGE='alephone'/g" -i configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
