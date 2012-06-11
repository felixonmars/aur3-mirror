# Maintainer : Atilla ÖNTAŞ <tarakbumba@gmail.com>
pkgname=meric
pkgver=20120611
pkgrel=1
pkgdesc="Bash wrapper for pacman and aur; fork of packer"
url="https://github.com/tarakbumba/meric"
license="GPL"
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
_gitroot='https://github.com/tarakbumba/meric.git'
_gitname='meric'

build() {
    cd "$srcdir"

    msg "Connecting to github GIT server...."

    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/meric/"
    mkdir -p "$pkgdir/etc/"
    install -m 755 meric "$pkgdir/usr/bin/meric"
    install -m 644 {meric.lang,COPYING,README,ChangeLog} "$pkgdir/usr/share/meric/"
    install -m 644 meric.conf "$pkgdir/etc/meric.conf"
}

