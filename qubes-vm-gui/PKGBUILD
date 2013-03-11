# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=qubes-vm-gui
pkgver=2.1.10
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url="http://qubes-os.org/"
license=('GPL')
groups=()
depends=(pulseaudio qubes-vm-core xorg-xinit)
# depends: xen gcc x11 xcomposite xdamage xt libtool-ltdl pulseaudio-libs qubes-core
makedepends=(pkg-config make gcc patch git automake autoconf libtool xorg-server-devel xorg-util-macros)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=qubes-vm-gui.install
changelog=
source=(qubes-gui-agent.service z-qubes-session.sh)
noextract=()
md5sums=() #generate with 'makepkg -g'
pa_ver=`pkg-config --modversion libpulse`


verify() {
  version=$1

  TAG=`git tag --points-at=$version | head -n 1`
  echo "Verifying git sources for version $version..."
  git checkout $TAG
  echo "If it fails, your should download Qubes master keys, verify the fingerprint and trust it"
  echo "gpg --recv-keys 0x36879494"
  echo "gpg --list-keys --fingerprint (fingerprint can be found on http://qubes-os.org/trac/wiki/VerifyingSignatures"
  echo "gpg --edit-key 0x36879494 then trust, 5, y, q"
  echo "wget http://keys.qubes-os.org/keys/qubes-developers-keys.asc"
  echo "gpg --import qubes-developers-keys.asc"
  git tag -v $TAG
}


build() {
  git clone git://git.qubes-os.org/marmarek/gui
 
  cd gui
  verify v$pkgver

  export PYTHON=python2

  # Bug fixes
  #sed 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' -i xf86-input-mfndev/configure.ac
  # pulse-core includes for pulse 3.0 have not been imported by qubes devs
  #cp -r pulse/pulsecore-2.1/ pulse/pulsecore-3.0/

  rm -f pulse/pulsecore
  ln -s pulsecore-$pa_ver pulse/pulsecore

  make appvm

  # Bug fixes : /bin/touch does not exists under archlinux
  sed 's:ExecStartPre=/bin/touch:ExecStartPre=/usr/bin/touch:' -i appvm_scripts/qubes-gui-agent.service
}

package() {
  cd gui

  install -D gui-agent/qubes_gui $pkgdir/usr/bin/qubes_gui
  install -D appvm_scripts/usrbin/qubes-session $pkgdir/usr/bin/qubes-session
  install -D appvm_scripts/usrbin/qubes_run_xorg.sh $pkgdir/usr/bin/qubes_run_xorg.sh
  install -D appvm_scripts/usrbin/qubes_xorg_wrapper.sh $pkgdir/usr/bin/qubes_xorg_wrapper.sh
  install -D appvm_scripts/usrbin/qubes-change-keyboard-layout $pkgdir/usr/bin/qubes-change-keyboard-layout
  install -D pulse/start-pulseaudio-with-vchan $pkgdir/usr/bin/start-pulseaudio-with-vchan
  install -D pulse/qubes-default.pa $pkgdir/etc/pulse/qubes-default.pa
  install -D pulse/module-vchan-sink.so $pkgdir/usr/lib/pulse-$pa_ver/modules/module-vchan-sink.so
  install -D xf86-input-mfndev/src/.libs/qubes_drv.so $pkgdir/usr/lib/xorg/modules/drivers/qubes_drv.so
  install -m 4555 -D relaxed_xf86ValidateModes/relaxed_xf86ValidateModes.so $pkgdir/usr/lib/relaxed_xf86ValidateModes.so
  install -D appvm_scripts/etc/X11/xorg-qubes.conf.template $pkgdir/etc/X11/xorg-qubes.conf.template
  install -D appvm_scripts/etc/init.d/qubes_gui $pkgdir/etc/init.d/qubes_gui
  install -D appvm_scripts/etc/profile.d/qubes_gui.sh $pkgdir/etc/profile.d/qubes_gui.sh
  install -D appvm_scripts/etc/profile.d/qubes_gui.csh $pkgdir/etc/profile.d/qubes_gui.csh
  install -D appvm_scripts/etc/profile.d/qubes-session.sh $pkgdir/etc/profile.d/qubes-session.sh
#  Note: sysconfig is almost not used on archlinux
#  install -D appvm_scripts/etc/sysconfig/desktop $pkgdir/etc/sysconfig/desktop
#  Note: u2mfn is loaded with qubes-core package (because it is required by qrexec)
#  install -D appvm_scripts/etc/sysconfig/modules/qubes_u2mfn.modules $pkgdir/etc/sysconfig/modules/qubes_u2mfn.modules
  install -D appvm_scripts/etc/X11/xinit/xinitrc.d/qubes_keymap.sh $pkgdir/etc/X11/xinit/xinitrc.d/qubes_keymap.sh
  install -D appvm_scripts/etc/tmpfiles.d/pulseaudio.conf $pkgdir/usr/lib/tmpfiles.d/qubes-pulseaudio.conf
  install -D appvm_scripts/etc/xdgautostart/qubes-pulseaudio.desktop $pkgdir/etc/xdg/autostart/qubes-pulseaudio.desktop
  install -D appvm_scripts/qubes-gui-agent.service $pkgdir/usr/lib/systemd/system/qubes-gui-agent.service
  install -d $pkgdir/var/log/qubes

# Specific to archlinux: qubes session needs to be the last started script when Xorg starts.
# For Fedora Qubes devs team choosed to populate it in /etc/sysconfig/desktop, but this is not supported by Archlinux
# Using z-qubes-session allows it to be the last started script in xinitrc.d...
  mkdir -p $pkgdir/etc/X11/xinit/xinitrc.d/
  install -D $srcdir/z-qubes-session.sh $pkgdir/etc/X11/xinit/xinitrc.d/z-qubes-session.sh

}

md5sums=('f387c2bea656e1ac0550d9607c64f7d7'
         '989d25b602d9f042fe8840f95fd4c1bc')

# vim:set ts=2 sw=2 et:
