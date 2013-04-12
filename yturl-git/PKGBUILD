# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl-git
_gitname=yturl
pkgver=20130412131502.822fab9
pkgrel=2
pkgdesc="Get direct media URLs to YouTube videos"
license=( "MIT" )
url="https://github.com/cdown/yturl"

if type -p python2 &>/dev/null && ! type -p python &>/dev/null; then
    _use_python_2=1
    depends=( "python2" )
else
    _use_python_2=0
    depends=( "python" )
fi

arch=( "any" )
makedepends=( "git" )
conflicts=( "yturl" )
provides=( "yturl" )
source=(
    "git://github.com/cdown/yturl.git"
)
md5sums=(
    "SKIP"
)

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    if (( _use_python_2 )); then
        sed -i '1s|^.*$|#!/usr/bin/env python2|g' "$_gitname/yturl"
    fi

    install -Dm755 "$_gitname/yturl" "$pkgdir/usr/bin/yturl"
}
