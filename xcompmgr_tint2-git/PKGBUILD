# Contributor: Vincent Quilin <vincent.quilin@gmail.com>

pkgname=xcompmgr_tint2-git
pkgver=20110603
pkgrel=1
pkgdesc="The X Composisting Manager fresh from freedesktop.org repositories with tint2 patch for real transparency"
arch=(i686 x86_64)
url="http://www.freedesktop.org/Software/xapps"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender')
makedepends=('git' 'xorg-util-macros')
provides=(xcompmgr)
conflicts=(xcompmgr xcompmgr-dana)
replaces=(xcompmgr xcompmgr-dana)
source=(tint2transparency.patch)
md5sums=('c20bbfc8201bd6562e6aa31168198332')

_gitroot="git://anongit.freedesktop.org/git/xorg/app/xcompmgr"
_gitname="xcompmgr"

build() {
  cd $startdir/src
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  msg "Patching for tint2 real transparency"
  patch -p1 < ../../tint2transparency.patch

  msg "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
