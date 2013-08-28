# Maintainer: zer4tul <zer4tul@gmail.com>

_gitname="xiami-downloader"
_gitbranch="master"
pkgname=xiami-downloader-git
pkgver=46.8b8dc0d
pkgrel=1
pkgdesc="Python script for download preview music from xiami.com."
arch=('any')
url="https://github.com/timothyqiu/xiami-downloader.git"
license=('MIT')
depends=("python2")
optdepends=("mutagen: ID3 tag support")
makedepends=('git')

source=("${_gitname}::git://github.com/timothyqiu/${_gitname}.git#branch=${_gitbranch}")

sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

#prepare() {
#	cd "${srcdir}/${_gitname}"
#    sed -i '1 i#\!/usr/bin/env python2' xiami{,_dl}.py
#}
prepare() {
    cd "$_gitname"
    echo '#!/bin/sh

    exec /usr/bin/python2 -O /usr/lib/python2.7/site-packages/xiami.py $@'> xiami
}

package(){
    cd "${_gitname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm755 "$srcdir/$_gitname/xiami" "$pkgdir/usr/bin/xiami"
}
#build() {
#    cd $srcdir
#    msg "Connecting to the GIT server...."
#
#    if [ -d $_gitname ]; then
#        cd $_gitname && git pull origin && cd ..
#        msg "Local files are updated."
#    else
#        git clone $_gitroot $_gitname
#    fi
#
#    msg "GIT checkout done"
#
#    mkdir -p "$pkgdir/$_insdir"
#    cp -rf "$_gitname/"* "$pkgdir/$_insdir"
#    cd "$pkgdir/$_insdir"
#    if [ -f LICENSE ]
#    then
#        mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
#        mv LICENSE "$pkgdir/usr/share/licenses/$pkgname"
#    fi
#    rm -rf tests .git*
#    # python2 fix
#    sed -i '1 i#\!/usr/bin/env python2' xiami{,_dl}.py
#
#    mkdir -p "$pkgdir/usr/bin"
#    cd "$pkgdir/usr/bin"
#    # some links
#    ln -s "$_insdir/xiami.py" xiami
#}
