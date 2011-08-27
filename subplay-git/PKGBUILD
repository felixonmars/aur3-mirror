# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

pkgname=subplay-git
pkgver=20110307
pkgrel=1
pkgdesc="CLI for YouTube's subscription feature (Git version)"
url="http://closure.ath.cx/subplay"
arch=('any')
license=('WTFPL')
depends=('python-beautifulsoup' 'mplayer' 'youtube-dl')
makedepends=('git')
provides=('subplay')
replaces=('subplay')
conflicts=('subplay')

_gitname="subplay"
_gitroot="git://git.lambda.ath.cx/patrick/$_gitname"

package() {
    msg "Connection to $_gitname repository..."
    if [ -d "$_gitname" ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" && cd "$_gitname"
    fi

    install -vDm755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
}
