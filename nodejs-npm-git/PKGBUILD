# Maintainer: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Marcus Carlsson <carlsson.marcus@gmail.com>

pkgname=nodejs-npm-git
pkgver=20110526
pkgrel=1
pkgdesc="A little package manager for node"
arch=('any')
url="http://npmjs.org/"
license=('MIT')
depends=('nodejs-git')
makedepens=('git')
provides=('nodejs-npm')
conflicts=('nodejs-npm')
source=("nodejs-npm.install" "npm.conf" "npm.sh")
md5sums=('fc17d7cf2e3f1ff6e8b307d3b09fe27d'
         'aed0d68ef55007541e25246daff46232'
         '957d3b1a4cd626db46b1e907197f86d5')

_gitorigin="git://github.com/isaacs/npm.git"
_gitname="nodejs-npm"

build() {
    cd $srcdir

    msg "Connecting to gitosis git server..."

    if [ -d $srcdir/$_gitname ]; then
        cd $_gitname && git pull origin || return 1
        msg "The local files are updated."
    else
        git clone $_gitorigin $_gitname || return 1
    fi

    msg "GIT checkout done!"

    cd $srcdir/$_gitname || return 1

    msg "Updating submodules.."
    git submodule update --init &> /dev/null || return 1

    msg "Creating necessary directories.."
    mkdir -p $pkgdir/usr || return 1

    msg "Setting necessary variables.."
    export npm_config_userconfig=/tmp/npmconf || return 1
    node cli.js config set prefix $pkgdir/usr &> /dev/null || return 1

    msg "Starting build process."
    make install &> /dev/null || return 1
}

package() {
    msg "Installing npm.sh.."
    install -D -m644 $srcdir/npm.sh $pkgdir/etc/profile.d/npm.sh || return 1

    msg "Installing global npm config.."
    install -m644 $srcdir/npm.conf $pkgdir/etc/npm.conf || return 1

    cd $srcdir/$_gitname || return 1

    msg "Copying license information.."
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1

    msg "Copying docs.."
    install -D -m644 README.md $pkgdir/usr/share/doc/$pkgname/README.md || return 1
    install -D -m644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS || return 1
    install -D -m644 CHANGES $pkgdir/usr/share/doc/$pkgname/CHANGES || return 1
}

# vim:set ts=2 sw=2 et:
