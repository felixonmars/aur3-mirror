# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmatecomponent
pkgver=20130101
pkgrel=1
pkgdesc="A set of language and system independant CORBA interfaces for creating reusable components"
url="https://github.com/mate-desktop/libmatecomponent"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('mate-corba' 'libxml2' 'glib2')
makedepends=('git' 'intltool' 'pkgconfig' 'flex')
groups=('mate')
options=('!emptydirs' '!libtool')
backup=('etc/matecomponent-activation/matecomponent-activation-config.xml')
source=(matecomponent-activation-config.xml)
install=libmatecomponent.install
md5sums=('e6164d98e8d4a7382b0ac1686c3bc11b')

_gitroot=git://github.com/mate-desktop/libmatecomponent.git
_gitname=libmatecomponent

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --libexecdir=/usr/lib/matecomponent \
    --enable-maintainer-mode=no || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  
  make DESTDIR="${pkgdir}" install
  install -m644 "${srcdir}/matecomponent-activation-config.xml" "${pkgdir}/etc/matecomponent-activation/"
}
