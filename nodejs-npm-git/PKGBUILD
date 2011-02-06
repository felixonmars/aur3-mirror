# Maintainer: Marcus Carlsson <carlsson.marcus@gmail.com>
pkgname=nodejs-npm-git
pkgver=20110120
pkgrel=1
pkgdesc="A little package manager for node"
arch=('any')
url="http://npmjs.org/"
license=('MIT')
depends=('nodejs>=0.2.3')
makedepens=('git')
provides=('nodejs-npm')
conflicts=('nodejs-npm')
source=(nodejs-npm.install
npm.conf)
md5sums=('d43c78cab50677e0d1749861fc2b953f'
         '33c4c40f21aff767da067d5c1fdaa246')

_gitroot="git://github.com/isaacs/npm.git"
_gitname="nodejs-npm"

build() {
    msg "Connecting to the git-server"
    if [ -d $_gitname ]; then
        (cd $_gitname && git pull || return 1)
    else
        git clone $_gitroot $_gitname || return 1
    fi

    msg "Creating dirs"
    mkdir -p $pkgdir/etc/profile.d/ || return 1
    mkdir -p $pkgdir/usr/local/{bin,lib/node,share/man} || return 1

    cd ${_gitname}

    export npm_config_userconfig=/tmp/npmconf || return 1
    node cli.js config set root $pkgdir/usr/local/lib/node --flags &> /dev/null || return 1
    node cli.js config set binroot $pkgdir/usr/local/bin --flags &> /dev/null || return 1
    node cli.js config set manroot $pkgdir/usr/local/share/man --flags &> /dev/null || return 1

    msg "Starting build process."
    node cli.js install || return 1

    export npm_config_userconfig= || return 1
    cd $srcdir
    # Global npm config
    install -m644 npm.conf $pkgdir/etc/npm.conf || return 1

    # Create npm.sh
    cat > $pkgdir/etc/profile.d/npm.sh <<END
#!/bin/sh
export npm_config_globalconfig=/etc/npm.conf
END

    export npm_config_globalconfig=/etc/npm.conf
}
