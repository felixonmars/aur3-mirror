# Last Maintainer: rtfreedman

pkgname=phasex-git
_gitname="phasex"
pkgver=4d28a72
pkgrel=4
pkgdesc="An experimental MIDI softsynth with flexible phase modulation and oscillator/LFO sources"
arch=('i686' 'x86_64')
url="https://github.com/williamweston/phasex"
license=('GPLv3+')
depends=('lash')
makedepends=('git')
install="phasex-git.install"
provides=('phasex')
conflicts=('phasex')

source=("git://github.com/williamweston/phasex" 
        "phasex-git.install" 
        "fix_DC_offset.patch"
        "snprintf-overflow.patch"
        "wave_sample.patch")
md5sums=('SKIP'
         '5e76b605e90fa9659afb0bdd0a474fe5'
         '342c5fc28165500beb631f4a5af3c4b3'
         '16b8ed859fdb1176121fa3d8d08120a9'
         'eac93b1cb8ec2c64acaf697c189122a2')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
#  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$_gitname"
  # https://github.com/williamweston/phasex/issues/10
  # http://lists.linuxaudio.org/pipermail/linux-audio-user/2014-August/098653.html
  patch -p1 -i "${srcdir}"/fix_DC_offset.patch
  patch -p1 -i "${srcdir}"/wave_sample.patch
  # gcc warning: snprintf will always overflow destination buffer
  patch -p1 -i "${srcdir}"/snprintf-overflow.patch

  cp pixmaps/phasex-icon-32x32.png pixmaps/phasex-icon.png
  aclocal
  autoconf
  automake
  autoheader
}

build() {
  cd "$_gitname"
  # see INSTALL for use of --enable-parts and --enable-cpu-power
  ./configure \
	--prefix=/usr \
	--enable-arch=native \
	--enable-parts=2 \
	--enable-cpu-power=3
  make
}
 
package() { 
  cd "$_gitname"
  # fix desktop file
  sed -i 's@/usr/share/phasex/pixmaps/phasex-icon.png@phasex@' misc/phasex.desktop

  make DESTDIR="$pkgdir/" install
  
  # cleanup
  for fn in compile depcomp missing version-sh install-sh; do \
	rm "$pkgdir/usr/share/phasex/$fn"
  done
  # 
  # icons are duplicated in usr/share/pixmaps/ and usr/share/icons/hicolor/<size>
  # should we remove icons located in pixmaps?
  #
#  for s in 24 36 72 96 192 256 512; do
#    rm -fr "$pkgdir/usr/share/icons/hicolor/${s}x${s}"
#  done
}

# vim:set ts=2 sw=2 et:
