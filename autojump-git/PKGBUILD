# Maintainer: Jason Axelson <jason.axelsonATgmail.com>
# Contributor: Sean Escriva <sean.escrivaATgmail.com>

pkgname=autojump-git
pkgver=20120628
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line"
arch=(any)
url="http://github.com/joelthelion/autojump"
license=('GPL3')
depends=('bash' 'python')
optdepends=('python: needed for jumpapplet')
makedepends=('git')
conflicts=('autojump')
provides=('autojump')
replaces=()
backup=()
source=()
#install=(${pkgname}.install)
install=${pkgname}.install
md5sums=()

_gitroot="git://github.com/joelthelion/autojump.git"
_gitname="autojump"

build() {
    cd ${srcdir}
    msg "Connecting to github.com GIT server...."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting script install..."

    git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build

    install -Dm644 bin/icon.png ${pkgdir}/usr/share/autojump/icon.png
    install -Dm755 bin/jumpapplet ${pkgdir}/usr/bin/jumpapplet
    install -Dm755 bin/autojump ${pkgdir}/usr/bin/autojump
    install -Dm644 docs/autojump.1 ${pkgdir}/usr/share/man/man1/autojump.1
    install -Dm755 bin/autojump.bash ${pkgdir}/etc/profile.d/autojump.bash
    install -Dm755 bin/autojump.sh ${pkgdir}/etc/profile.d/autojump.sh
    install -Dm755 bin/autojump.zsh ${pkgdir}/etc/profile.d/autojump.zsh
    install -Dm644 bin/_j ${pkgdir}/usr/share/zsh/site-functions/_j
}
# vim:set ts=4 sw=4 et:
