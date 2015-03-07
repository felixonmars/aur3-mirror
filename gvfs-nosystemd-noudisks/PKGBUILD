pkgname='gvfs-nosystemd-noudisks'
pkgver=1.22.3
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('avahi' 'dbus-glib' 'fuse' 'intltool' 'libarchive' 'libcdio-paranoia' 'libgphoto2' 'libsoup' 'smbclient' 'libsecret' 'docbook-xsl' 'gtk3' 'libmtp' 'libbluray')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/gvfs/${pkgver%.*}/gvfs-$pkgver.tar.xz)
pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio (without systemd and udisks dependency, also removed makedepends libimobiledevice, gnome-online-accounts)"
depends=('avahi' 'dconf' 'fuse' 'libarchive' 'libcdio-paranoia' 'libsoup' 'libsecret' 'libbluray')
replaces=('gvfs-obexftp')
provides=("gvfs=$pkgver")
conflicts=('gvfs')
optdepends=('gvfs-smb: SMB/CIFS (Windows client) support'
		  'gvfs-gphoto2: gphoto2 (PTP camera/MTP media player) support'
		  'gvfs-afp: Apple Filing Protocol (AFP) support'
		  'gvfs-mtp: MTP device support'
		  'gtk3: Recent files support')
install=gvfs.install


build() {
  cd "gvfs-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gvfs \
      --with-bash-completion-dir=/usr/share/bash-completion/completions \
      --disable-obexftp \
      --disable-systemd
  make
}

package() {
  cd "gvfs-$pkgver"
  sed -e 's/^am__append_4/#am__append_4/' \
      -e 's/^am__append_5/#am__append_5/' \
      -e 's/^am__append_6/#am__append_6/' \
      -e 's/^am__append_7/#am__append_7/' \
      -i monitor/Makefile
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  rm usr/lib/gvfs/gvfsd-{smb,smb-browse,afp,afp-browse,gphoto2,mtp}
  rm usr/share/gvfs/mounts/{smb,smb-browse,afp,afp-browse,gphoto2,mtp}.mount
  rm usr/share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml
  rm usr/share/GConf/gsettings/gvfs-smb.convert
}

sha256sums=('c778342e09a84d8c69b1b7ce7f943f6f2444a995bb0c0754ef1746afa8935182')