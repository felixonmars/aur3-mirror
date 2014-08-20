# $Id$
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Diego <cdprincipe@gmail.com>

_pkgname=numix-themes
pkgname=numix-themes-yellow
pkgver=2.2.3
pkgrel=2
pkgdesc="A flat and light theme with a modern look using a pleasant yellow color."
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
sha256sums=('b0acc2d81300b898403766456d3406304553cc7016677381f3179dbeb1192a2d')

prepare() {
    cd Numix-${pkgver}
    for FILE in gtk-2.0/gtkrc \
            gtk-3.0/gtk-dark.css \
            gtk-3.0/gtk-widgets-assets.css \
            gtk-3.0/gtk-widgets.css \
            gtk-3.0/gtk.css \
            gtk-3.0/settings.ini \
            gtk-3.0/apps/gnome-applications.css \
            gtk-3.0/apps/granite-widgets.css \
            gtk-3.0/apps/lightdm-gtk-greeter.css \
            gtk-3.0/apps/nemo.css \
            gtk-3.0/apps/synaptic.css \
            gtk-3.0/apps/unity.css \
            gtk-3.0/apps/xfce.css \
            metacity-1/metacity-theme-2.xml \
            metacity-1/metacity-theme-3.xml \
            openbox-3/themerc \
            xfce-notify-4.0/gtkrc \
            xfwm4/themerc \
            index.theme
    do
        sed -i 's/#fc6f5d/#ffd666/g' "${FILE}"
        sed -i 's/#d64937/#ffbb00/g' "${FILE}"
        sed -i 's/#2d2d2d/#141414/g' "${FILE}"
        sed -i 's/Numix/Numix Yellow/' "${FILE}"
    done

    # Little hack for MATE
    cd metacity-1
    ln -s metacity-theme-2.xml metacity-theme-1.xml
}

package() {
    cd Numix-${pkgver}
    install -dm 755 "${pkgdir}"/usr/share/themes/Numix-Yellow
    rm -rf .git .gitignore CREDITS LICENSE README.md
    cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-Yellow
}
