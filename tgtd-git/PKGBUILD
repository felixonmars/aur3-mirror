# Contributor: Wu Siyun <woosiyun@gmail.com>
pkgname=tgtd-git
pkgver=1.0.36
pkgrel=0
pkgdesc="tgt daemon and userspace tools(ISCSI Support)"
arch=('x86_64' 'i686')
url="http://stgt.sourceforge.net/" 
license=('GPL') 
groups=()
depends=('perl-config-general' 'libxslt')
makedepends=()
optdepends=('sg3_utils')
provides=()
conflicts=('tgt')
replaces=()
backup=( 'etc/tgt/targets.conf' )
options=()
install=
makedepends=('git')
source=(tgtd.service)
_gitroot="git://github.com/fujita/tgt.git"
_gitname="tgt"


md5sums=('c9d573d4dbbf5b424c4041fe13ada55a')

build() {
  cd "$srcdir"
  msg "Connectiong to GIT Server..."
  if [[ -d "$_gitname.git" ]];then
     cd "$_gitname.git" && git pull origin
     msg "The local files are updated"
  else
    git clone "$_gitroot" "$_gitname.git"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf $srcdir/src
  mkdir -p $srcdir/src
  git clone $srcdir/$_gitname.git $srcdir/src/$_gitname
  cd $srcdir/src/$_gitname
  install -Dm644  $srcdir/tgtd.service $pkgdir/usr/lib/systemd/system/tgtd.service
  make ISCSI=1 PREFIX=$pkgdir
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
