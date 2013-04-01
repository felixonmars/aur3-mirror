# Maintainer: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-extension-remove-accessibility-icon-git
pkgver=20130330
pkgrel=1
pkgdesc="A gnome-shell extension for removing the accessibility icon"
arch=('any')
url="https://github.com/lomegor/Remove-Accessibility"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
makedepends=('git')
provides=('gnome-shell-extension-remove-accessibility-icon-git')
conflicts=('gnome-shell-extension-remoce-accessibility-icon')
groups=('gnome-shell-extensions')

_name="gnome-shell-extension-remove-accessibility-icon-git"
_gitroot="git://github.com/lomegor/Remove-Accessibility.git"
_uuid="removeaccesibility@lomegor"

build() {
    cd ${srcdir}

    if [ -d $_name ]; then
        cd $_name
        git pull origin master
    else
        git clone ${_gitroot} ${_name}
    fi
}

package() {
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd ${srcdir}/${_name}
    install -Dp -m 0644 {extension.js,metadata.json} \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
