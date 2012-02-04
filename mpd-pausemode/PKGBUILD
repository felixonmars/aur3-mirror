# Contributor: Mildred <silkensedai@online.fr>
# kate: hl Bash; space-indent on; indent-width 2;

pkgname=mpd-pausemode
pkgver=0.1
pkgrel=2
pkgdesc="Daemon to pause MPD after each song"
arch=('i686' 'x86_64')
url="mailto:silkensedai@online.fr"
license=('MIT' 'BSD')
makedepends=(ftjam)
source=(Jamfile Jamconfig pausemode.c README \
  http://www.musicpd.org/uploads/files/libmpdclient-0.13.0.tar.bz2)
md5sums=('16c1e64cf4b2f9e6d95210f6e7c3b589' '2c7e496dc46d3750c11172a178283e44'\
         'add820382da50616cf78659b61afabf2' '83ad38e5bef7d5c7fa2f40131828f8a0'\
         'b72b0a31b13629bb4e254e0f5ebe07e4')
noextract=()
# md5sum Jamfile Jamconfig pausemode.c libmpdclient-0.13.0.tar.bz2 | cut -d' ' -f1 | xargs

build() {
  local libmpd="libmpdclient-0.13.0"
  cd "$startdir/src"
  echo "LIBMPD.DIR = $libmpd ;" >> Jamconfig
  jam
  head -n 20 pausemode.c | tail -n +2 > LICENCE
  install -D mpd-pausemode "$startdir/pkg/usr/bin/mpd-pausemode"
  install -D LICENCE "$startdir/pkg/usr/share/licenses/$pkgname/LICENCE"
  install -D "$libmpd/COPYING" "$startdir/pkg/usr/share/licenses/$pkgname/COPYING"
}