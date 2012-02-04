# Maintainer: Bryan Bennett <bbenne10 at gmail dotcom>
pkgname=xdcp-hg
pkgver=11
pkgrel=1
pkgdesc="A GTK XDefaults color picker"
arch=('i686' 'x86_64')
url="http://bitbucket.org/bbenne10"
license=('BSD')
depends=('python2' 'wxpython')
makedepends=('mercurial')
_hgrepo="xdcp"
_hgroot=$url


build() {
    cd $srcdir
    msg "Connecting to hg server..."
    if [[ -d "$_hgrepo/.hg" ]]; then
        msg "pull"
        ( cd $_hgrepo && hg pull -u )
    else
        msg "clone"
        hg clone "${_hgroot}/${_hgrepo}"
    fi
    cd "${_hgrepo}"

    install -D -m755 xdcp "$pkgdir/usr/bin/xdcp"
    install -D -m755 colorlist "$pkgdir/usr/share/xdcp/colorlist"
}

# vim:set ts=2 sw=2 et:
