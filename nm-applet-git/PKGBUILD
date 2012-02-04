# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: L42y <423300@gmail.com>
# Contributor: macau <tema.prokopenko@gmail.com>

pkgname=nm-applet-git
pkgver=20110829
pkgrel=1
pkgdesc="GTK frontend NetWorkmanager without gnome-bluetooth support"
arch=('armv7h')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'libgnome-keyring' 'polkit-gnome' 'gtk3'
         'notification-daemon' 'libnotify' 'gnome-icon-theme'
         'mobile-broadband-provider-info' 'gconf')
makedepends=('intltool')
provides=('nm-applet')
conflicts=('network-manager-applet-svn' 'network-manager-applet')
options=('!libtool')
install=${pkgname}.install

_gitroot="git://git.gnome.org/network-manager-applet"
_gitname="network-manager-applet"

build() {
  cd ${srcdir}
  
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
	  cd $_gitname && git pull origin
	  msg "The local files are updated."
  else
	  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build
 
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-maintainer-mode
  make
}

package() {
  cd ${srcdir}/$_gitname-build

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain nm-applet ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
