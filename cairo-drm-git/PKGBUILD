# Contributor: Adriano Foschi <adriano DOT src AT gmail DOT com>

pkgname=cairo-drm-git
_realname=cairo
pkgver=20090921
pkgrel=1
pkgdesc="Cairo vector graphics library with drm support"
license="GPL"
arch=(i686 x86_64)
options=('!libtool')
url="http://cairographics.org/"
depends=('libdrm' 'libpng>=1.2.33' 'libxrender' 'fontconfig>=2.6.0' 'pixman>=0.12.0' 'xcb-util>=0.3.1')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkgconfig')
provides=('cairo=1.8.4')
conflicts=("$_realname" 'cairo-git')
replaces=('cairo-cvs')
source=()
md5sums=()

_gitroot="git://anongit.freedesktop.org/git/cairo"
_gitname="cairo"

build() {
  cd $startdir/src
  msg "Connecting to git.cairographics.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  #sed -i -e "s:1.7:1.10:g" configure.in 
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --enable-xcb --disable-static --enable-drm || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -rf ${startdir}/pkg/usr/share/gtk-doc
  rm -rf ${startdir}/src/${_gitname}-build

}
