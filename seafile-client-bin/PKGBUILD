# Maintainer: localizator <localizator@ukr.net>

pkgname=seafile-client-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is the seafile client for synchronizing your local files with a seafile server."
url="http://seafile.com"
license=(GPLv3)
groups=('network')
depends=('jansson' 'qt4' 'libevent' 'sqlite' 'openssl' 'python2-simplejson')
arch=('i686' 'x86_64')

options=()
_realname=seafile
if [ "$CARCH" = 'i686' ]; then
    source=(
        "${_realname}_${pkgver}_i386.deb::https://bitbucket.org/haiwen/seafile/downloads/${_realname}_${pkgver}_i386.deb" 
        "seaf-cli-python2.patch"
    )
    sha256sums=(
        'e0599f8691a7701a4f882d78d23adb95f1722a9a995ae4713cd98e3ecf526485'
        '5af002d56bad1071c6c8b675abbcd5211cd0734760ffdb599b78f4c2ceaa0b41'
    )
elif [ "$CARCH" = "x86_64" ]; then
    source=(
        "${_realname}_${pkgver}_amd64.deb::https://bitbucket.org/haiwen/seafile/downloads/${_realname}_${pkgver}_amd64.deb" 
        "seaf-cli-python2.patch"
    )
    sha256sums=(
        'ae076ea953d9e82180ab1f0538661999940cf1638a27962f053d4bf92b0dc1dd'
        '5af002d56bad1071c6c8b675abbcd5211cd0734760ffdb599b78f4c2ceaa0b41'
    )
fi

prepare() {
    cd $srcdir
    tar xvf data.tar.gz
}
build() {
    patch -p0 < seaf-cli-python2.patch
    mv usr/lib/python2.7/dist-packages usr/lib/python2.7/site-packages
}

package() {
    cp -rp usr $pkgdir
}
