# Maintainer: Faheem Pervez <trippin1@gmail.com>
# Based on Morfeo's lightdm PKGBUILD and Xiao-Long Chen's lightdm-ubuntu packages
# Thanks also to Rexilion and lost-distance: http://forums.gentoo.org/viewtopic-t-902618-start-0.html

pkgname=lightdm-gtk2
pkgver=1.0.6
pkgrel=3
_ubuntu_rel=0ubuntu1.2
_ubuntu_ver=1.0.6
pkgdesc="A lightweight display manager, built against GTK+2 and with working autologin & password-less login"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm"
license=('GPL3' 'LGPL3')
source=("http://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-*}_$pkgver.orig.tar.gz"
        "https://launchpad.net/ubuntu/oneiric/+source/lightdm/1.0.6-0ubuntu1.2/+files/lightdm_1.0.6-0ubuntu1.2.diff.gz"
        'lightdm'
        'lightdm.service'
        'lightdm-gtk-greeter.conf'
        'lightdm-ubuntu.pam'
        'Xsession'
        'lightdm-x11.patch'
        'dontapplyme'
        'lightdm-autologin-ubuntu.pam'
        'lightdm.pam'
        'lightdm-autologin.pam')
md5sums=('d3de7006f03f6ab3cdb7dc15508eed28'
         'dcadef43c5122da16ec5931e54e01bcc'
         '6699eb35f65ff498d1d05e6782f4f902'
         '52003b799271a4d19be51f05b8184eff'
         'f97ecbdfc89e73f206a96d28f1b4fa5e'
         '3f5dbf67b458f7220b9afed98914042d'
         '683bc8bc3f423157065dc6295f9fecef'
         'bb9db2c2c10aa95bd2dbfc6e8e67f00a'
         '8af6b4b2e184af80dfb4f4711756c058'
         'c44b0a60a00fa1b6ecd64f2a920c52c5'
         '247c1b8545bb546ebde6a6bc83b18b48'
         'b893037722ebc2f9388b23c492f5b841')
depends=('gnome-themes-standard' 'gnome-icon-theme' 'libwebkit' 'dbus-glib' 'gtk2' 'libxklavier' 'accountsservice')
options=(!libtool)
optdepends=('xorg-server-xephyr: run lightdm in test mode' 
	    'lightdm-webkit-greeter-bzr: webkit lightdm greeter'
            'lightdm-crowd-greeter: 3d lightdm greeter'
            'unity-greeter: default Ubuntu 11.10 greeter')
makedepends=('gtk-doc' 'gnome-common' 'gnome-doc-utils' 'gobject-introspection' 'pkg-config' 'intltool' 'patch')
provides=("lightdm=${pkgver}")
conflicts=('lightdm')
backup=(etc/apparmor.d/lightdm-guest-session
	etc/dbus-1/system.d/org.freedesktop.DisplayManager.conf
	etc/lightdm/keys.conf
	etc/lightdm/lightdm-gtk-greeter.conf
	etc/lightdm/lightdm.conf
	etc/lightdm/users.conf
	etc/pam.d/lightdm)
install=lightdm.install


build() {
  cd "${srcdir}/${pkgname%-*}-$pkgver"

  patch -Np1 -i "${srcdir}/lightdm-x11.patch"
  patch -Np1 -i "${srcdir}/lightdm_1.0.6-0ubuntu1.2.diff" #Add Ubuntu debian folder; we can cherry-pick its patches

  for i in $(cat 'debian/patches/series' | grep -v '#'); do
    if grep -q "${i}" "${srcdir}/dontapplyme"; then continue; fi #Not all patches are suited for use with LightDM under Arch - skip 'em
    patch -Np1 -i "debian/patches/${i}"
  done

  sed -i "s/gtk+-3.0/gtk+-2.0/g" configure.ac #Build against GTK2 library
  sed -i "s/dist_pkglibexec_SCRIPTS/#dist_pkglibexec_SCRIPTS/g" utils/Makefile.am #automake version 1.11.2 messed things up

  find -type f -iname '*_moc.cpp' -exec rm -f {} \; #yuyichao: Fix Qt building

  NOCONFIGURE=1 ./autogen.sh

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --libexecdir=/usr/lib/lightdm \
    --localstatedir=/var \
    --with-greeter-user=lightdm \
    --with-greeter-session=lightdm-gtk-greeter

  #Lightdm make target does not exist
  sed -i 's/lightdm-session//' tests/src/Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-$pkgver"
  make DESTDIR="${pkgdir}" install

  #Install init script and systemd service
  install -dm755 "${pkgdir}/etc/rc.d/"
  install -dm755 "${pkgdir}/lib/systemd/system/"
  install -m755 "${srcdir}/lightdm" "${pkgdir}/etc/rc.d"
  install -m644 "${srcdir}/lightdm.service" "${pkgdir}/lib/systemd/system/"

  #Install PAM service
  install -dm755  "${pkgdir}/etc/pam.d/"
  install -m644 "${srcdir}/lightdm.pam" "${pkgdir}/etc/pam.d/lightdm"
  install -m644 "${srcdir}/lightdm-autologin.pam" "${pkgdir}/etc/pam.d/lightdm-autologin"

  #Configuration files specific to Ubuntu
  rm -rf "${pkgdir}/etc/init/"

  #Install configuration files
  install -d -m755 "${pkgdir}/usr/share/doc/lightdm/"
  install -d -m755 "${pkgdir}/etc/lightdm/"
  install -m644 "${pkgdir}/etc/lightdm/lightdm.conf" "${pkgdir}/usr/share/doc/lightdm/"
  install -m644 "${pkgdir}/etc/lightdm/keys.conf" "${pkgdir}/usr/share/doc/lightdm/"
  install -m644 "${srcdir}/lightdm-gtk-greeter.conf" "${pkgdir}/etc/lightdm/"

  #Install binaries and scripts
  install -m755 "${srcdir}/Xsession" "${pkgdir}/etc/lightdm/"
  install -d -m755 "${pkgdir}/usr/lib/lightdm/lightdm/" #Well, gdmflexiserver has to get installed somehow, since automake sucks
  install -m755 utils/gdmflexiserver "${pkgdir}/usr/lib/lightdm/lightdm/gdmflexiserver"

  sed -i -e 's/^\(minimum-uid=\).*$/\11000/g' "${pkgdir}/etc/lightdm/users.conf"
  sed -i -e 's@/usr\(/sbin/nologin\)$@\1@g' "${pkgdir}/etc/lightdm/users.conf"
  sed -i -e "s|#session-wrapper=lightdm-session|session-wrapper=/etc/lightdm/Xsession|g" $pkgdir/etc/lightdm/lightdm.conf
}
