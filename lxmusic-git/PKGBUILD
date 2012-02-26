# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=lxmusic-git
pkgver=20120226
pkgrel=1
pkgdesc="Lightweight XMMS2 client (part of LXDE)"
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk2>=2.14.0' 'xmms2' 'libnotify>=0.7')
makedepends=('git' 'intltool')
conflicts=('lxmusic')
provides=('lxmusic')
replaces=('lxmusic-svn')
groups=('lxde-git')
source=("fix-compilation-with-libnotify-0.7.patch")
md5sums=("c182ca0c7feffb9ceab6481660799b30")

_gitroot='git://lxde.git.sourceforge.net/gitroot/lxde/lxmusic'
_gitname='lxmusic'

build() {
  cd "${srcdir}"
  
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout. Preparing sources..."

  [ -d "${srcdir}/${_gitname}-build" ] && rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  
  msg "Patching for libnotify>=0.7."
  patch -p1 -i ../fix-compilation-with-libnotify-0.7.patch || warning "Patch failed. Maybe upstream got updated, ignoring."
  
  msg "Starting make..."

  # Generating Makefile, etc
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static || return 1

  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}-build"
  
  _provide_version="$(echo '@VERSION@' | ./config.status --file=-)"
  provides=("lxmusic=${_provide_version}")
  
  make DESTDIR="${pkgdir}" install || return 1
}
