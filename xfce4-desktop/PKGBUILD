# $Id:$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=xfce4-desktop
pkgver=4.8.3
pkgrel=1
pkgdesc="Triggers installation of a good working XFCE desktop :)"
arch=('i686' 'x86_64')
url=http://wiki.archlinux.org/index.php/Xfce4
license=('GPL2')
# Install the whole group 'xfce4' and then install this dummy package, it will
# trigger installation of 'avahi', 'fortune-mod', 'gamin', 'gnome-icon-theme',
# 'parole', 'sane', 'scrot' and some essentional parts from 'xfce4-goodies'
# group ;)
depends=(avahi fortune-mod gamin gnome-icon-theme parole sane scrot
    ristretto
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    xarchiver
    xfburn
    xfce-utils
    xfce4-appfinder
    xfce4-icon-theme
    xfce4-mixer
    xfce4-panel
    xfce4-session
    xfce4-settings)

pacman -Sg xfce4 |awk '{print $2}' |while read component; do
    depends=($component ${depends[@]})
done

optdepends=('bootsplash-fb: for minimal/working fbsplash package set'
    'lxdm-svn: for a Lightweight Display Manager')

build() {
    true
}

# vim:set ts=2 sw=2 et:
