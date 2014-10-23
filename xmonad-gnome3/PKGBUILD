# Maintainer: Tony Sokhon <tonyskn@gmail.com>
pkgname=xmonad-gnome3
pkgver=20141022
pkgrel=2
pkgdesc="Minimal XMonad/GNOME3 hybrid desktop configuration"
arch=('i686' 'x86_64')
url="https://github.com/tonyskn/arch-aur-packages/tree/master/xmonad-gnome3"
license=('MIT')

depends=(xmonad
         xmonad-contrib
         xmobar
         gnome-session
         polkit-gnome
         gnome-keyring
         gnome-control-center
         gnome-settings-daemon
         gnome-settings-daemon-compat
         notification-daemon
         gnome-themes-standard
         gnome-screensaver
         xfce4-terminal
         nautilus
         file-roller
         unclutter
         xorg-xsetroot)

optdepends=('slim: login manager')

source=(xmonad-gnome-session
        xmonad.desktop
        xmonad-gnome.session
        xmonad-gnome.desktop
        xmonad-sample.hs
        xinitrc.sample)
md5sums=('d5d584c0d6a0a1db8ff62339e85a3beb'
         'ce501be68f33c494ddf6a2e96d325734'
         'e3e085766feb35df6d426fc4d027fdf9'
         '757ac47aeab12fe0eae171970277e91b'
         '1e8d213a7ccec97dbc84658d92dddf61'
         'c9600c70ca06ab45f995b56f2e4f8c13')

package() {
  cd ${srcdir}

  # Main executable: launches gnome-session with XMonad as WM
  install -D -m755 xmonad-gnome-session "${pkgdir}/usr/bin/xmonad-gnome-session"

  # Sample scripts
  install -d "${pkgdir}/usr/share/xmonad-gnome3/"
  install -m644 -t "${pkgdir}/usr/share/xmonad-gnome3/" xmonad-sample.hs xinitrc.sample
  echo '>> To get started, copy /usr/share/xmonad-gnome3/{xinitrc.sample,xmonad-sample.hs} into ~/{.xinitrc,.xmonad/xmonad.hs} then run `systemctl start slim`'

  # xmonad-gnome GNOME session files
  install -D -m644 xmonad.desktop "${pkgdir}/usr/share/applications/xmonad.desktop"
  install -D -m644 xmonad-gnome.session "${pkgdir}/usr/share/gnome-session/sessions/xmonad-gnome.session"
  install -D -m644 xmonad-gnome.desktop "${pkgdir}/usr/share/xsessions/xmonad-gnome.desktop"

  # this is required by gnome-settings-daemon-compat
  install -dm755 "${pkgdir}/usr/lib"
  ln -s /usr/lib/libgnome-desktop-3.so.10.0.0 "${pkgdir}/usr/lib/libgnome-desktop-3.so.8"
}
