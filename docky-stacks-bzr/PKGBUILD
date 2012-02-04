# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor: Benjamin Mtz (cruznick) <cruznick at archlinux dot us>

pkgname=docky-stacks-bzr
pkgver=1540
pkgrel=1
pkgdesc="Docky with stacks plugin (bzr branch)"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~docky-core/docky/stacks"
license=('GPL')
depends=('gnome-desktop-sharp' 'gnome-keyring-sharp' 'gtk2' 
	'mono-addins' 'gio-sharp-git' 'hicolor-icon-theme' 'dbus-sharp'
	'dbus-sharp-glib' 'notify-sharp-svn' 'xdg-utils' 'dockmanager-bzr')
makedepends=('bzr' 'intltool' 'gettext')
options=()
provides=(docky)
source=()
md5sums=()

_bzrtrunk=lp:~docky-core/docky/stacks
_bzrmod=stacks

build() {

  export MONO_SHARED_DIR=${srcdir}/.wabi
  mkdir -p ${MONO_SHARED_DIR}


cd $srcdir/

msg "Connecting to the server...."
if [ ! -d ./${_bzrmod} ]; then
bzr checkout ${_bzrtrunk} -r ${pkgver}
else
cd ${_bzrmod} && bzr up -r ${pkgver}
fi
msg "BZR checkout done or server timeout"
cd "${srcdir}/${_bzrmod}"
 ./autogen.sh  || return 1
 ./configure --prefix=/usr --bindir=/bin \
		--sbindir=/sbin --mandir=/usr/share/man \
		--infodir=/usr/share/info --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
