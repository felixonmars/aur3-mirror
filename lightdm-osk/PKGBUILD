pkgname=lightdm-osk
pkgbldname=lightdm
pkgver=1.0.10
pkgrel=1
pkgdesc="A lightweight display manager"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm"
license=('GPL3' 'LGPL3')
source=("https://launchpad.net/lightdm/1.0/$pkgver/+download/$pkgbldname-$pkgver.tar.gz"
lightdm
lightdm.service
lightdm-gtk-greeter.conf
lightdm.pam
lightdm-autologin.pam
Xsession
lightdm-x11.patch
lightdm-gtk-greeter.patch
lightdm.tmpfiles)
depends=('libwebkit' 'dbus-glib' 'gtk3' 'libxklavier' 'accountsservice')
options=(!libtool)
install=lightdm.install

optdepends=('xorg-server-xephyr: run lightdm in test mode' 
	    'lightdm-webkit-greeter-bzr: webkit lightdm greeter'
            'lightdm-crowd-greeter: 3d lightdm greeter')

makedepends=('gtk-doc' 'gnome-common' 'gnome-doc-utils' 'gobject-introspection' 'pkg-config' 'intltool' 'patch')

backup=(etc/apparmor.d/lightdm-guest-session
	etc/dbus-1/system.d/org.freedesktop.DisplayManager.conf
	etc/lightdm/keys.conf
	etc/lightdm/lightdm-gtk-greeter.conf
	etc/lightdm/lightdm.conf
	etc/lightdm/users.conf
	etc/pam.d/lightdm)

build() {
  cd $srcdir/$pkgbldname-$pkgver
   patch -p1 -i ../../lightdm-gtk-greeter.patch
   patch -Np1 -i ../lightdm-x11.patch
   find -iname '*moc*' -exec rm {} \;
   sed -i -e "s|dist_pkglibexec_SCRIPTS = gdmflexiserver|#dist_pkglibexec_SCRIPTS = gdmflexiserver|g" utils/Makefile.am
   ./autogen.sh 
   ./configure --prefix=/usr \
     --sysconfdir=/etc --disable-static --libexecdir=/usr/lib/lightdm \
     --localstatedir=/var --with-greeter-user=lightdm \
     --with-greeter-session=lightdm-gtk-greeter     
   sed -i 's/lightdm-session//' tests/src/Makefile
   make || return 1
}

package() {
  cd $srcdir/$pkgbldname-$pkgver
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/etc/rc.d 
  mkdir -p $pkgdir/lib/systemd/system/
  mkdir -p $pkgdir/etc/pam.d 
  mkdir -p $pkgdir/var/run/lightdm

# init services file 
  install -m755 ../lightdm $pkgdir/etc/rc.d
  install -m644 ../lightdm.service $pkgdir/lib/systemd/system/
  install -D -m644 ../lightdm.tmpfiles $pkgdir/usr/lib/tmpfiles.d/lightdm.conf

# pam file for gnome-keyring
  install -m644 ../lightdm.pam $pkgdir/etc/pam.d/lightdm
  install -m644 ../lightdm-autologin.pam $pkgdir/etc/pam.d/lightdm-autologin
  
# some tweaks  
  rm -r $pkgdir/etc/init
  cp ../lightdm-gtk-greeter.conf $pkgdir/etc/lightdm
  chmod +x ../Xsession && cp ../Xsession $pkgdir/etc/lightdm
  sed -i -e "s|minimum-uid=500|minimum-uid=1000|g" $pkgdir/etc/lightdm/users.conf  
  sed -i -e "s|/usr/sbin/nologin|/sbin/nologin|g" $pkgdir/etc/lightdm/users.conf
  sed -i -e "s|#session-wrapper=lightdm-session|session-wrapper=/etc/lightdm/Xsession|g" $pkgdir/etc/lightdm/lightdm.conf
  sed -i -e "s|#autologin-session=UNIMPLEMENTED|#autologin-session=UNIMPLEMENTED\n#pam-service=lightdm-autologin|g" $pkgdir/etc/lightdm/lightdm.conf
}

md5sums=('25031cbfc69ce8a6e1470e97a40b24d9'
         '6699eb35f65ff498d1d05e6782f4f902'
         '52003b799271a4d19be51f05b8184eff'
         '17c8f6ae0ff350fca16b9162e9735182'
	 '917df3fa0c57ff7a8af4e66c28b1b7db'
         '8dc625f5d30da5ff762366f0f906f869'
         '683bc8bc3f423157065dc6295f9fecef'
         'bb9db2c2c10aa95bd2dbfc6e8e67f00a'
	 '7ba738f7ef2370bbfdec1b553c817b03'
	 '72b35c23098c8ddd76d82da7b847e10b')