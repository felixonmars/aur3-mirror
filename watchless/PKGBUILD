# Maintainer: Christian Petrov <Christian.Petrov@outlook.com>>
pkgname=watchless
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple Bash tool to watch for LESS file changes using inotifywait to compile those files to CSS with imported files support." 
license="GPL"
url="https://github.com/chpet/watchless"
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'lessc' 'inotify-tools')
_gitroot='https://github.com/chpet/watchless.git'
_gitname='watchless'

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
    install -m 755 watchless.sh "$pkgdir/usr/bin/watchless"
}
