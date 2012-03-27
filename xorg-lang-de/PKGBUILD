# PKGBUILD by schreiberstein [at] gmail [dot] com
# I'll probably create scripts for other keymaps too.
# There is also a extended version of this PKGBUILD. It's a splitbuild that creates particular packages for various keymaps : http://pastebin.com/prcuGZw5

pkgname=xorg-lang-de
pkgrel=1
pkgver=0.1
pkgdesc="Installs a preconfigured config-file that'll change X.Org keymap from english to german"
license="GPL"
url="http://schreiberstein.de"
arch=('any')
depends=('xorg-server')
backup=(etc/X11/xorg.conf.d/20-keyboard.conf)
provides=(xorg-lang-de)

build() {
# Create the config-file
cat > $srcdir/20-keyboard.conf<< "EOF"
Section "InputClass"
        Identifier "keyboard"
        MatchIsKeyboard "yes"
        Option "XkbLayout" "de"
        Option "XkbVariant" "nodeadkeys"
EndSection
EOF
}

package() {
install -Dm644 $srcdir/20-keyboard.conf $pkgdir/etc/X11/xorg.conf.d/20-keyboard.conf
}
