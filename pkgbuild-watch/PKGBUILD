# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pkgbuild-watch
pkgver=20120612
pkgrel=1
pkgdesc="Monitor upstream for updates."
url="http://kmkeen.com/pkgbuild-watch"
license="GPL"
arch=('any')
makedepends=('git')
depends=('bash' 'curl' 'html2text' 'expac')
_gitroot='https://github.com/keenerd/pkgbuild-watch.git'
_gitname='pkgbuild-watch'

build() {
    cd "$srcdir"
  
    msg "Connecting to github GIT server...."
    
    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
}

package() {      
    cd "$srcdir/$_gitname"
    install -Dm 755 pkgbuild-watch "$pkgdir/usr/bin/pkgbuild-watch"
    install -Dm 755 urlwatch.sh    "$pkgdir/usr/bin/urlwatch.sh"
}

