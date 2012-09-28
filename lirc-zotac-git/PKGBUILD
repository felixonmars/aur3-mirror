# PKGBUILD for lirc-zotac-git
#
# This PKGBUILD is for a lirc version that supports Zotac Infrared Remote Controls.
# The driver for this version has been created by FernetMenta, which can be found
# at https://github.com/FernetMenta/lirc.
#
# INSTALLATION INSTRUCTIONS
# -------------------------
#
# Just running makepkg isn't enough. The package requires manual user interaction
# when it comes to select the proper driver. Once you run makepkg, you'll be asked
# which driver you want to build. Select the first option in the initial dialog
# and select "USB devices" -> "Zotac USB IR Receiver" and then go back to the initial
# menu and choose "Save configuration & run configure".
#

# Maintainer: Christian Jurk <commx@commx.ws>
pkgname=lirc-zotac-git
pkgver=20120928
pkgrel=1
pkgdesc="Linux Infrared Remote Control with Zotac driver"
arch=('i686' 'x86_64')
url="https://github.com/FernetMenta/lirc"
license=('GPL')
groups=()
depends=('systemd')
makedepends=('git' 'automake' 'autoconf' 'gcc' 'dialog' 'libtool')
provides=('lircd')
conflicts=('lirc')
replaces=()
backup=()
options=()
install=
source=('lircd.service'
        'hardware.conf'
        'lircd.conf'
        'lircd.tmpfiles.conf')
noextract=()
md5sums=('fb71786d7a5513ea87158a11e0b86335'
         '4d630b76d15fa8e366e0b12364a29a73'
         'c31e4eab1549d6fd0ffddb81a6773d01'
         '87d5b05f95291b11dd38447f36e92adc')

_gitroot=https://github.com/FernetMenta/lirc.git
_gitname=lirc
_udev_rule='SUBSYSTEM=="usb", ATTRS{idVendor}=="0471", ATTRS{idProduct}=="20cc", SYMLINK+="remote", ACTION=="add", TAG+="systemd", ENV{SYSTEMD_WANTS}="lirc.service"'
_udev_file="$pkgdir/etc/udev/rules.d/10-zotac-remote.rules"
_xorg_evdev_file="$pkgdir/etc/X11/xorg.conf.d/10-zotac-remote.conf"
_dev_name="PHILIPS MCE USB IR Receiver- Spinel plus"

_create_udev_rule() {
  mkdir -p "$pkgdir/etc/udev/rules.d"
  echo "$_udev_rule" > $_udev_file
}

# Make the X server ignore the remote control
_create_xorg_evdev_section() {
  mkdir -p "$pkgdir/etc/X11/xorg.conf.d"
  echo "# Automatically added by $pkgname" > $_xorg_evdev_file
  echo "Section \"InputClass\"" >> $_xorg_evdev_file
  echo "  Identifier \"$_dev_name\"" >> $_xorg_evdev_file
  echo "  MatchProduct \"$_dev_name\"" >> $_xorg_evdev_file
  echo "  MatchIsKeyboard \"true\"" >> $_xorg_evdev_file
  echo "  Option \"Ignore\" \"true\"" >> $_xorg_evdev_file
  echo "EndSection" >> $_xorg_evdev_file
}

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

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./setup.sh
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  mv -f "$pkgdir/usr/local/"* "$pkgdir/usr/"
  rm -rf "$pkgdir/usr/local"

  _create_udev_rule
  _create_xorg_evdev_section

  # Install Zotac-specific configuration files
  mkdir -p "$pkgdir/etc/lirc"
  install -m 755 "$srcdir/hardware.conf" "$pkgdir/etc/lirc/hardware.conf"
  install -m 755 "$srcdir/lircd.conf" "$pkgdir/etc/lirc/lircd.conf"

  # Install systemd service file
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 644 "$srcdir/lircd.service" "$pkgdir/usr/lib/systemd/system/lircd.service"

  # Create /var/run/lirc by systemd-tmpfiles
  mkdir -p "$pkgdir/etc/tmpfiles.d"
  install -m 755 "$srcdir/lircd.tmpfiles.conf" "$pkgdir/etc/tmpfiles.d/lircd.conf"
}

# vim:set ts=2 sw=2 et:
