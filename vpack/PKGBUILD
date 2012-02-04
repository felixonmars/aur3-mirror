# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=vpack
pkgver=20110909
pkgrel=2
pkgdesc="vABS Packaging Utility"
arch=('i686' 'x86_64')
url="http://github.com/estevao/vpack"
license=('GPL')
makedepends=('git')
depends=('sqlite3' 'zsync')
optdepends=('sudo')
install='vpack.install'
_gitbase='http://github.com/estevao/vpack.git'
_gitrepo='vpack'

package() {
    cd "${srcdir}"

    msg "Connecting to GitHub..."
        
    if [ -d "$startdir/src/$_gitrepo" ] ; then
        cd "$_gitrepo" && git pull origin
    else
        git clone "$_gitbase"
        cd "$_gitrepo"
    fi

    mkdir -p "$pkgdir/etc"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/var/lib/vpack"
    install -m 755 vpack "$pkgdir/usr/bin/vpack"
    install -m 644 vpack.conf "$pkgdir/etc/vpack.conf"

    if [ "$CARCH" = i686 ]; then
        sed -i '/ARCH=/s|x86_64|i686|' "${pkgdir}/etc/vpack.conf"
    fi
}
