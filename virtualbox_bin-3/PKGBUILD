# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: xduugu <xduuguΘgmx·com>
# Contributor: Peter 'piie' Feuerer <peterΘpiie·net>
# Contributor: Sascha Pfau <MrPeacockΘgmail·com>
# Contributor: iggy <iggy.mfΘgmail·com>

pkgname=virtualbox_bin-3
pkgver=3.2.12
_build=68302
pkgrel=1
pkgdesc='Powerful x86 virtualization (Personal Use Binaries Edition).'
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('custom:PUEL')
depends=('libidl2' 'libxcursor' 'libxinerama' 'libxslt' 'curl' 'gcc' 'make' 'kernel26-headers' 'python2')
optdepends=('qt: for GUI support'
            'sdl: for VBoxSDL and GUI support'
            'mesa: for OpenGL support'
            'libgl: for shared OpenGL support'
            'libxt: for shared clipboard support'
            'alsa-lib: for ALSA support'
            'pulseaudio: for PulseAudio support')
provides=("virtualbox=${pkgver}")
conflicts=('virtualbox-ose' 'virtualbox-modules')
backup=('etc/vbox/vbox.cfg')
install='virtualbox.install'
_arch='x86'
[ "${CARCH}" = 'x86_64' ] && _arch='amd64'
source=("VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run::http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run"
        '10-vboxdrv.rules'
        'vboxdrv')
md5sums=('984b2dea108ba151ee5203f95987463c'
         '98859bfca9ef2ebf2ea43eb9123316fc'
         '8b3b5fb34d5e8594ee873d7947f3d09b')
[ "${CARCH}" = 'x86_64' ] && md5sums[0]='408db0aff4ada9664b8cdf156916ec64'

build() {
  # Check and unpack the run package via sh(1)
  sh "VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run" --check
  echo yes | sh "VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run" --target "${srcdir}" \
    --nox11 --noexec &> /dev/null

  # Unpack bundled files
  install -d "${pkgdir}/opt/VirtualBox"
  cd "${pkgdir}/opt/VirtualBox"
  tar -xjf "${srcdir}/VirtualBox.tar.bz2"

  install -d "${pkgdir}/usr/"{bin,share/applications,share/pixmaps}

  # Hardened build: Mark binaries suid root, create symlinks for working around
  #                 unsupported $ORIGIN/.. in VBoxC.so and make sure the
  #                 directory is only writable by the user (paranoid).
  chmod 4511 VirtualBox VBox{SDL,Headless,NetDHCP}
  for _lib in VBox{VMM,REM,RT,DDU,XPCOM}.so; do
    ln -sf "/opt/VirtualBox/${_lib}" "components/${_lib}"
  done
  chmod go-w .

  # VBoxNetAdpCtl needs to be suid root in any case
  chmod 4511 VBoxNetAdpCtl

  # Replace VirtualBox built-in Qt by system Qt libraries (disabled as of
  # 2010-03-26, 3.1.6-1)
  #for _lib in libQt{Core,Gui,Network,OpenGL}; do
  #  rm "${_lib}VBox.so.4"
  #  ln -s "/usr/lib/${_lib}.so.4" "${_lib}VBox.so.4"
  #done

  # Patch "vboxshell.py" to use Python 2.x instead of Python 3
  sed -i 's#/usr/bin/python#\02#' "${pkgdir}/opt/VirtualBox/vboxshell.py"

  # Install the SDK
  cd "${pkgdir}/opt/VirtualBox/sdk/installer"
  VBOX_INSTALL_PATH="/opt/VirtualBox" python2 vboxapisetup.py install --root "${pkgdir}"
  rm -Rf build
  cd "${pkgdir}/opt/VirtualBox"

  # Install rc.d script for module compilation
  install -Dm0755 "${srcdir}/vboxdrv" "${pkgdir}/etc/rc.d/vboxdrv"

  # Replace init script stuff
  sed -i -e 's,sudo /etc/init.d/vboxdrv setup,/etc/rc.d/vboxdrv setup,g' "${pkgdir}/opt/VirtualBox/VBox.sh"
  sed -i -e 's,sudo /etc/init.d/vboxdrv restart,modprobe vboxdrv,g' "${pkgdir}/opt/VirtualBox/VBox.sh"

  # Fix kernel modules
  sed -i "s/linux\/autoconf.h/generated\/autoconf.h/g" "${pkgdir}"/opt/VirtualBox/src/vboxhost/{{vboxnetadp,vboxnetflt,vboxdrv}/{r0drv/linux/the-linux-kernel.h,include/iprt/types.h},vboxdrv/SUPDrvInternal.h,{vboxdrv,vboxnetadp}/include/internal/iprt.h}
  
  # Install udev rules
  install -Dm0644 "${srcdir}/10-vboxdrv.rules" "${pkgdir}/lib/udev/rules.d/10-vboxdrv.rules"

  # Symlink the launchers
  for _bin in VirtualBox VBox{Headless,Manage,SDL,SVC,Tunctl,NetAdpCtl} rdesktop-vrdp; do
    ln -s "/opt/VirtualBox/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done

  # Symlink the desktop icon and ".desktop" files
  ln -s /opt/VirtualBox/VBox.png "${pkgdir}/usr/share/pixmaps/VBox.png"
  ln -s /opt/VirtualBox/virtualbox.desktop "${pkgdir}/usr/share/applications/VirtualBox.desktop"

  # Symlink the license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/VirtualBox/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/PUEL"

  # Setup configuration
  install -d "${pkgdir}/etc/vbox"
  echo 'INSTALL_DIR="/opt/VirtualBox"' > "${pkgdir}/etc/vbox/vbox.cfg"
}