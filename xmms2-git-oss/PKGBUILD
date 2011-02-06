# Contributor: Xilon <xilon@gmail.com>
# Contributor: lh <jarryson@gmail.com>

pkgname=xmms2-git-oss
pkgver=20081113
pkgrel=1
pkgdesc="A complete rewrite of the popular music player with autocompletion and CUE support without ALSA dependence and fix /etc/rc.d/xmms2d"
arch=(i686 x86_64)
url="http://wiki.xmms2.xmms.se"
license=('LGPL')
backup=('etc/conf.d/xmms2d.conf')
depends=('sqlite3' 'libmad' 'libvorbis')
makedepends=('python' 'glib' 'sqlite3' 'curl' 'libmad' 'faad2' 'boost'
	'flac' 'libmpcdec' 'smbclient' 'libmms' 'ffmpeg' 'ruby' 'avahi'
	'jack-audio-connection-kit' 'libxml2' 'pyrex' 'libofa')
provides=('xmms2')
conflicts=('xmms2')
install=xmms2.install
options=('force')
source=(xmms2d.conf \
	xmms2d.rc \
	bash-completion-xmms2 \
	startms2.patch)
md5sums=()

_gitroot="git://git.xmms.se/xmms2/xmms2-devel"
_gitname="xmms2-devel"

build() {
  cd $startdir/src
  msg "Connecting to git.xmms.se GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  cd $srcdir

  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  patch -p1 -i ../startms2.patch || return 1

  ./waf configure --nocache --prefix=/usr --without-plugins=alsa --with-optionals=python,cli,launcher,xmmsclient++,xmmsclient++-glib,avahi,perl,ruby || return 1 || return 1
  ./waf build || return 1
  ./waf --destdir=$startdir/pkg install || return 1

  install -D -m 0755 ../xmms2d.rc $startdir/pkg/etc/rc.d/xmms2d && \
  install -D -m 0644 ../xmms2d.conf $startdir/pkg/etc/conf.d/xmms2d.conf
  mkdir -pv $startdir/pkg/etc/bash_completion.d
  install -v -m 644 $startdir/src/bash-completion-xmms2 $startdir/pkg/etc/bash_completion.d/xmms2
}

