# Maintainer: Zubkov Alexander <green@msu.ru>
pkgname=zfs-behlendorf-git
pkgver=20110324
pkgrel=1
pkgdesc="Native ZFS for Linux (behlendorf)"
arch=(x86_64)
url="https://github.com/behlendorf"
license=('GPL' 'CDDL')
depends=('util-linux')
makedepends=('git')
backup=('etc/zfs/zdev.conf')
provides=('zfs')
options=(!libtool)

_modules=('spl' 'zfs')
_gitroot="https://github.com/behlendorf"
_gitname=stub

build() {
    cd "$srcdir"

    for _gitname in ${_modules[*]}
    do
        (
        msg "Connecting to GIT server ($_gitname)...."
        if [ -d $_gitname ] ; then
            cd $_gitname && git pull origin
            msg "The local files are updated."
        else
            git clone "$_gitroot/$_gitname.git" $_gitname
        fi

        msg "GIT checkout done or server timeout"
        )
    done

    for _gitname in ${_modules[*]}
    do
        (
        msg "Starting make ($_gitname)..."

        rm -rf "$srcdir/$_gitname-build"
        git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
        cd "$srcdir/$_gitname-build"

        _conf_opt=
        case $_gitname in
        zfs)
            _conf_opt="--with-spl=$srcdir/spl-build/"
            ;;
        esac

        ./configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib \
            $_conf_opt
        make
        )
    done
}

package() {
    for _gitname in ${_modules[*]}
    do
        (
        msg "Installing ($_gitname)..."
        cd "$srcdir/$_gitname-build"
        make DESTDIR="$pkgdir/" install
        )
    done
} 
