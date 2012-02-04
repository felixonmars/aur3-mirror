# Maintainer: Zephyr
# Contributor: Det <nimetonmaili at gmail dot com>
# Contributor: Christian Autermann <christian@autermann.org>
# Contributor: Martin Lee <hellnest.fuah@gmail.com>
# Contributor: Ricardo Funke
# Contributor: PirateJonno <j@skurvy.no-ip.org>
# Contributor: lh <jarryson#gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=plymouth-systemd-git
pkgver=20111018
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support (Git version)"
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/Plymouth"
license=('GPL')
depends=('systemd' 'libdrm' 'pango')
makedepends=('git')
options=('!libtool' '!emptydirs')
install=${pkgname}.install
backup=('etc/plymouth/plymouthd.conf')
provides=('plymouth')
conflicts=('plymouth' 'plymouth-git')
backup=('etc/plymouth/plymouthd.conf')
source=('arch-logo.png'
        "http://projects.archlinux.org/svntogit/packages.git/plain/cryptsetup/repos/core-${CARCH}/encrypt_hook"
        "http://projects.archlinux.org/svntogit/packages.git/plain/cryptsetup/repos/core-${CARCH}/encrypt_install"
        'encrypt_hook.patch'
        'encrypt_install.patch'
        'plymouthd.conf'
        'plymouth.functions'
        'plymouth.initcpio_hook'
        'plymouth.initcpio_install'
        'plymouth-update-initrd.patch'
        'system-release'
        'plymouth-halt.service'
        'plymouth-kexec.service'
        'plymouth-poweroff.service'
        'plymouth-quit-wait.service'
        'plymouth-quit.service'
        'plymouth-read-write.service'
        'plymouth-reboot.service'
        'plymouth-start.service'
        'systemd-ask-password-plymouth.path'
        'systemd-ask-password-plymouth.service'
        'kdm-plymouth.service'
        'gdm-plymouth.service'
        'lxdm-plymouth.service'
        'kdm-unpatched-plymouth.service'
        'no-x11-no-gtk.patch')
sha1sums=('3bc168dd06ff3e2790f26c131209a7fb4a5ccbd7'  # arch-logo.png
          '2d3dfa82eabe51f1addf7472f65a7588324e1c0a'  # encrypt_hook
          '2ddf6061162b481f343ce883083b6ab3b64342e0'  # encrypt_install
          '70e210bceb266b974fc6f313f0a460d21c29af7b'  # encrypt_hook.patch
          '08dc7cdc5873634042052014b5250d552158dc4e'  # encrypt_install.patch
          '01235a179d8f991a37035c15cdcc0733b581afd4'  # plymouthd.conf
          '60a55ff2cf417bafa07cf82abcf7680e5c046e52'  # plymouth.functions
          '332bb6a59e0a58e75684c4545e7a645ca9007bd9'  # plymouth.initcpio_hook
          '5352033523558ab1e6c49dc57f984f7c66d83610'  # plymouth.initcpio_install
          '019663ae0070163e8d6cf268e7efeaaef474e725'  # plymouth-update-initrd.patch
          '4c31cbbfbdeb48593641ff600c8d4fb7bda2b01c'  # system-release
          '1ff04c726a0ee01fd1ce23c9b3205e6314954f8e'  ####\systemd units/###
          'afc2eab7323e97d40866408420f0004650be24ff'  # will
          '3cd095baf881f9cb3bb8f29e9afe358de2617dc6'  # remove
          '237614be83146536b86c3ba5cf95a7b7a83a6c44'  # when
          '9b4f71e02de18d5427d972b35a6aa6c8540c30eb'  # upstream
          '2246a79471b60b45226d2719b608e2c4dcf439cf'  # adds
          '9dcd3c0320879a4a0cda41a9d8046be25822bc85'  # them
          '52481c6cc91fcf15b101ec04e31ef00d5f67d03b'  #
          '6e2b68c857afdada851f6f986e09604dd52eeee0'  # 
          '29f519c6fb6fe8a972cb3a894d5cc8679da16917'  ####/systemd units\###
          '44c03d1cc71f7b9fa6ef7022584f0f81c9c17faf'  # kdm-plymouth.service
          '92b2ea373991af921d8e2c8a8d06c31b4f9e7313'  # gdm-plymouth.service
          '31eb516da0e78d9c185dfb9ee5b94468f713ff1c'  # lxdm-plymouth.service
          'c80522e4fe29f8e4cd958e1fbb8407c53c5f4388'  # kdm-unpatched-plymouth.service
          '19916ae9759eacb4381399961f96af93c229e1d2') # no-x11-no-gtk.patch

_gitroot='git://git.freedesktop.org/git/plymouth'
_gitname='plymouth'

build() {
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done. Preparing sources..."

  cd "${srcdir}"
  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build

  msg "Applying Patches..."

  patch -p0 -i encrypt_hook.patch
  patch -p0 -i encrypt_install.patch

  cd ${_gitname}-build
  patch -p0 -i "${srcdir}/plymouth-update-initrd.patch"

  # Remove GTK+ dependency and X11 Renderer
  patch -p0 -i "${srcdir}/no-x11-no-gtk.patch"

  sed -e 's:png_set_gray_1_2_4_to_8:png_set_expand_gray_1_2_4_to_8:g' \
       -i src/libply-splash-graphics/ply-image.c

  msg "Starting make..."

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --enable-tracing \
    --with-system-root-install \
    --enable-gdm-transition \
    --with-gdm-autostart-file=yes \
    --with-logo=/usr/share/plymouth/arch-logo.png \
    --with-background-start-color-stop=0x000000 \
    --with-background-end-color-stop=0x4D4D4D
#    --enable-systemd-integration

  make
}

package() {
  cd ${_gitname}-build

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/plymouth.initcpio_install" "${pkgdir}/lib/initcpio/install/plymouth"
  install -Dm644 "${srcdir}/plymouth.initcpio_hook" "${pkgdir}/lib/initcpio/hooks/plymouth"
  install -Dm644 "${srcdir}/encrypt_install" "${pkgdir}/lib/initcpio/install/plymouth-encrypt"
  install -Dm644 "${srcdir}/encrypt_hook" "${pkgdir}/lib/initcpio/hooks/plymouth-encrypt"
  install -Dm644 "${srcdir}/plymouth.functions" "${pkgdir}/etc/rc.d/functions.d/plymouth.functions"
  install -Dm644 "${srcdir}/arch-logo.png" "${pkgdir}/usr/share/plymouth/arch-logo.png"
  install -Dm644 "${srcdir}/system-release" "${pkgdir}/etc/system-release"
  install -Dm644 "${srcdir}/plymouthd.conf" "${pkgdir}/etc/plymouth/plymouthd.conf"

  # Plymouth<->systemd integration, copied from systemd --enable-plymouth installation
  install -Dm644 "${srcdir}/plymouth-halt.service" "${pkgdir}/lib/systemd/system/plymouth-halt.service"
  install -Dm644 "${srcdir}/plymouth-kexec.service" "${pkgdir}/lib/systemd/system/plymouth-kexec.service"
  install -Dm644 "${srcdir}/plymouth-poweroff.service" "${pkgdir}/lib/systemd/system/plymouth-poweroff.service"
  install -Dm644 "${srcdir}/plymouth-quit-wait.service" "${pkgdir}/lib/systemd/system/plymouth-quit-wait.service"
  install -Dm644 "${srcdir}/plymouth-quit.service" "${pkgdir}/lib/systemd/system/plymouth-quit.service"
  install -Dm644 "${srcdir}/plymouth-read-write.service" "${pkgdir}/lib/systemd/system/plymouth-read-write.service"
  install -Dm644 "${srcdir}/plymouth-reboot.service" "${pkgdir}/lib/systemd/system/plymouth-reboot.service"
  install -Dm644 "${srcdir}/plymouth-start.service" "${pkgdir}/lib/systemd/system/plymouth-start.service"
  install -Dm644 "${srcdir}/plymouth-start.service" "${pkgdir}/lib/systemd/system/plymouth-start.service"
  install -Dm644 "${srcdir}/systemd-ask-password-plymouth.path" "${pkgdir}/lib/systemd/system/systemd-ask-password-plymouth.path"
  install -Dm644 "${srcdir}/systemd-ask-password-plymouth.service" "${pkgdir}/lib/systemd/system/systemd-ask-password-plymouth.service"
  install -Dm644 "${srcdir}/kdm-plymouth.service" "${pkgdir}/lib/systemd/system/kdm-plymouth.service"
  install -Dm644 "${srcdir}/gdm-plymouth.service" "${pkgdir}/lib/systemd/system/gdm-plymouth.service"
  install -Dm644 "${srcdir}/lxdm-plymouth.service" "${pkgdir}/lib/systemd/system/lxdm-plymouth.service"
  install -Dm644 "${srcdir}/kdm-unpatched-plymouth.service" "${pkgdir}/lib/systemd/system/kdm-unpatched-plymouth.service"
  # Hook up the units so systemd uses them, copied from systemd --enable-plymouth installation
  mkdir -p ${pkgdir}/lib/systemd/system/{halt.target.wants,kexec.target.wants,multi-user.target.wants,poweroff.target.wants,reboot.target.wants,sysinit.target.wants}
  ln -s "/lib/systemd/system/plymouth-halt.service" "${pkgdir}/lib/systemd/system/halt.target.wants/"
  ln -s "/lib/systemd/system/plymouth-kexec.service" "${pkgdir}/lib/systemd/system/kexec.target.wants/"
  ln -s "/lib/systemd/system/plymouth-quit-wait.service" "${pkgdir}/lib/systemd/system/multi-user.target.wants/"
  ln -s "/lib/systemd/system/plymouth-quit.service" "${pkgdir}/lib/systemd/system/multi-user.target.wants/"
  ln -s "/lib/systemd/system/plymouth-poweroff.service" "${pkgdir}/lib/systemd/system/poweroff.target.wants/"
  ln -s "/lib/systemd/system/plymouth-reboot.service" "${pkgdir}/lib/systemd/system/reboot.target.wants/"
  ln -s "/lib/systemd/system/plymouth-read-write.service" "${pkgdir}/lib/systemd/system/sysinit.target.wants/"
  ln -s "/lib/systemd/system/plymouth-start.service" "${pkgdir}/lib/systemd/system/sysinit.target.wants/"
}

# vim: set ts=2 sw=2 ft=sh noet:
