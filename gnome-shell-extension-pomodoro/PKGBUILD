# Maintainer: Arun <cute.tec@gmail.com>
# Contributor: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-extension-pomodoro
pkgver=0.7
pkgrel=1
pkgdesc="Pomodoro timer extension for gnome-shell"
arch=('any')
url="https://github.com/codito/gnome-shell-pomodoro"
license=('GPL3')
depends=('gnome-shell>=3.6')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
provides=('gnome-shell-extension-pomodoro')
conflicts=('gnome-shell-extension-pomodoro-git')
source=("https://github.com/codito/gnome-shell-pomodoro/zipball/${pkgver}")
md5sums=('bcb8c761ed5cc3ecc5d733b472efd98b')
groups=('gnome-shell-extensions')
install='gschemas.install'

_name="codito-gnome-shell-pomodoro-6e520fa"

build() {
    cd ${srcdir}/${_name}
    mkdir ${pkgdir}/usr
    # for some reason while extracting autogen.sh loses execute rights
    chmod +x ${srcdir}/${_name}/autogen.sh
    ./autogen.sh --prefix=${pkgdir}/usr --disable-schemas-compile
    make
}

package() {
    cd ${srcdir}/${_name}
    make install
}
