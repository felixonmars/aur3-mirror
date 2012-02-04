# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer:: The Green Arrow  <revan@no-log.org>
pkgname=panflute-bzr
pkgver=522
pkgrel=1
pkgdesc="Music player interface and panel applet - successor to music-applet"
arch=('i686' 'x86_64')
url="https://launchpad.net/panflute"
license=('GPL')
depends=('dbus-python' 'gnome-python' 'python-notify' 'pygtk' 'python-numpy' 'gnome-python-desktop')
makedepends=('perlxml' 'gnome-doc-utils>=0.18' 'intltool' 'gnome-panel'
             'gnome-python-desktop' 'python-mpd' 'bzr')
replaces=('music-applet')
install=panflute.install
# the "http" protocol.
# For instance:
# _bzrtrunk="http://bazaar.launchpad.net/~user/project/branch"
# _bzrmod="project"
_bzrtrunk=https://launchpad.net/panflute/trunk
_bzrmod=panflute

build() {
  cd "$srcdir"

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  else
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
  fi

  msg "bzr checkout done or server timeout"

  msg "Removing old build directory..."
  rm -rf $srcdir/$_bzrmod-build
  msg "Creating build directory..."
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD
  #
  msg "Starting make..."

  # Run autoconf/automake tools
  ./autogen.sh  --prefix=/usr \
	          --sysconfdir=/etc \
		          --localstatedir=/var \
			          --libexecdir=/usr/lib/panflute \
				          --disable-schemas-install
  # For a cmake build, the following command may have been used:
  # cmake -DCMAKE_INSTALL_PREFIX=/usr

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  install -m755 -d "${pkgdir}"/usr/share/gconf/schemas
  gconf-merge-schema "${pkgdir}"/usr/share/gconf/schemas/${pkgname}.schemas --domain ${pkgname} \
	             "${pkgdir}"/etc/gconf/schemas/*.schemas || return 1

  rm -rf "${pkgdir}"/etc/gconf
}


