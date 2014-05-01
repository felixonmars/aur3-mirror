# Contributor: XaBz <xabz.2k5@gmail.com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
# Contributor: ryooichi <ryooichi+arch AT gmail DOT com>
# Contributor: twa022 <twa022 at gmail dot com>
# Real thanks goes to jelly, mike_93 and the original creators of mintmenu, usp, slab...
# See also:
#   http://bbs.archlinux.org/viewtopic.php?id=66987
#   http://bbs.archlinux.org/viewtopic.php?id=68633
#   http://github.com/jelly/archmenu
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=mintmenu-xfce4
_pkgname=mintmenu
pkgver=5.5.3
pkgrel=1
pkgdesc="Linux Mint Menu for Xfce4"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mintmenu"
license=('GPL')
depends=('gnome-python' 'python-gnomedesktop'
         'pyxdg' 'pygtk' 'archlinux-artwork' 'exo>=0.5' 'gksu' 'xdg-utils' 'xfce4-xfapplet-plugin'
         'xfce4-settings' 'xfce-utils' 'xfce4-session' python2)
#gnome-panel-bonobo python-gnomeapplet
optdepends=('alacarte: for editing the gnome menu'
            'wakka: to manage your packages')
conflicts=(mintmenu)
source=("${url}/${_pkgname}_${pkgver}.tar.gz"
    removescript
    arch-xfce-patch.diff
)
#    arch-patch.diff
install=mintmenu-xfce4.install
build() {
    cd $srcdir/${_pkgname}
    patch -Np0 -i $srcdir/arch-xfce-patch.diff

    cd $srcdir/${_pkgname}/usr
    install -dm755 $pkgdir/usr
    tar -c ./ | tar -x -C $pkgdir/usr
    
    rm -f usr/lib/linuxmint/mintMenu/*.pyc usr/lib/linuxmint/mintMenu/plugins/*pyc

    ## Xfce4 specific changes
    sed -i -e "s/__version__/'$pkgver'/" $pkgdir/usr/lib/linuxmint/mintMenu/mintMenu.py

#    install -m755 $srcdir/removescript $pkgdir/usr/lib/linuxmint/mintMenu/
    cd "${pkgdir}/usr/lib/linuxmint/mintMenu"
    ./compile.py || return 1

}

_build() {
  cd "$srcdir/${_pkgname}"
  
  ## Xfce4 specific changes
  sed -i 's:nautilus:exo-open --launch FileManager:g' usr/lib/linuxmint/mintMenu/plugins/places.py
  sed -i -e 's:gnome-terminal:exo-open --launch TerminalEmulator:g' \
         -e 's:gnome-control-center:xfce4-settings-manager:g' \
         -e 's:xdg-screensaver lock:xflock4:g' \
         -e 's:gnome-session-save --logout-dialog:xfce4-session-logout --fast:g' \
         -e 's:gnome-session-save --shutdown-dialog:xfce4-session-logout --fast:g' \
         -e 's:Log out or switch user:Log out:g' \
         -e 's:gtkpacman:wakka:g' usr/lib/linuxmint/mintMenu/plugins/system_management.py

  sed -i -e "s/__version__/$pkgver/" usr/lib/linuxmint/mintMenu/mintMenu.py
  cp -R usr $pkgdir/
  chmod 644 $pkgdir/usr/lib/bonobo/servers/mintMenu.server
  install -m755 $srcdir/removescript $pkgdir/usr/lib/linuxmint/mintMenu/
  cd "${pkgdir}"/usr/lib/linuxmint/mintMenu
  ./compile.py || return 1
}

sha256sums=('ead574bd0c18425f00a3adcb9821bdb9b6efe38abb5b509e70d3d55c6b7c1ae6'
         '9533d0f5416af1f2b8ef5097f06e39135278eef856994d859c4ee7ba57d6fcaa'
         'fc0b08c9e8e94feb31a07697dbaf811ae75e5bd63e63302417ef488e64466bca')
