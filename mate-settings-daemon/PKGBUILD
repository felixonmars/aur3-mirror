# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-settings-daemon
pkgver=20130129
pkgrel=1
pkgdesc="The MATE Settings daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmatekbd' 'mate-desktop' 'libmatenotify' 'gstreamer0.10-base'
         'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig' 'mate-common>=20130129')
options=('!libtool')
url="https://github.com/mate-desktop/mate-settings-daemon/"
install=mate-settings-daemon.install
groups=('mate')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-settings-daemon.git
_gitname=mate-settings-daemon

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


  # Remove --disable-pulse if you want pulseaudio support
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/mate-settings-daemon \
    --disable-static \
    --disable-pulse \
    --disable-schemas-install \
    --enable-polkit || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

  install -d -m755 "${pkgdir}/usr/share/mateconf/schemas"
  mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
