# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>
# Contributor: Sebastian Hase <sebastian_hase@gmx.de>
# Contributor: Joe Davison <joe@thosedamnpeanuts.com>
pkgname=scummvm-svn
pkgver=49126
pkgrel=1
pkgdesc="A 'virtual machine' for several classic graphical point-and-click adventure games (SVN version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.scummvm.org/"
depends=('sdl' 'alsa-lib' 'libmad' 'libvorbis' 'zlib' 'libmpeg2' 'flac>=1.1.4' 'fluidsynth')
makedepends=('subversion')
source=()
provides=('scummvm')
conflicts=('scummvm')
md5sums=()

_svntrunk=https://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/trunk
_svnmod=scummvm

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [[ -d "${srcdir}/${_svnmod}-build" ]] && rm -r "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./configure --backend=sdl \
      --with-mpeg2-prefix=/usr \
      --with-flac-prefix=/usr \
      --prefix=/usr \
      --enable-all-engines || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -D -m 644 dists/scummvm.desktop ${pkgdir}/usr/share/applications/scummvm.desktop
}
