# Contributor: Gildo Fiorito <fiorito.g@gmail.com>
# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=ncrack-svn
pkgver=27747
pkgrel=1
pkgdesc="High-speed network authentication cracking tool \
         Supported protocols: FTP, TELNET, SSH, HTTP(S)"
url="http://nmap.org/ncrack/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
makedepends=('subversion')
provides=('ncrack')
conflicts=('ncrack')
source=()
md5sums=()

_svntrunk=https://svn.nmap.org/ncrack
_svnmod=ncrack

build() {
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up)
    else
        svn co --username guest --password "" --no-auth-cache $_svntrunk --config-dir ./ $_svnmod
        if [ ! $PIPESTATUS -eq 0 ]; then
            msg "SVN checkout failed"
            return 1
        fi
    fi

    msg "SVN checkout successful"
    msg "Starting make..."

    rm -rf $_svnmod-build
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=${pkgdir} install || return 1

    rm -rf ${srcdir}/$_svnmod-build
}
