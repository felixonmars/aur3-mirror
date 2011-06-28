
#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=urlol-git
pkgver=20110627
pkgrel=1
install=('urlol.install')

pkgdesc="Desktop Utility to open url files, git version"
arch=('any')
provides=('urlol')
conflicts=('urlol')
url="https://github.com/yuyichao/urlol"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-utils')
makedepends=('git')

_gitroot='git://github.com/yuyichao/urlol.git'
_gitname='urlol'
package()
{
    cd "$srcdir"

    msg "Connecting to github.com"

    if [ -d "$startdir/src/$_gitname" ] ;then
        cd "$startdir/src/$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot"
    fi
    msg "GIT checkout done or server timeout"

    cd "$srcdir/$_gitname"

    git checkout master

    ./install -p "$pkgdir" --nopost
}
