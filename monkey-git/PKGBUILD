# Maintainer:  Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Joel Heaton <jheaton at archlinux dot us>
# Contributor: Gary Wright <wriggary at g mail dot com>

pkgname=monkey-git
_pkgname=${pkgname/-git/}
pkgver=20120714
pkgrel=1
pkgdesc='A fast and lightweight HTTP server designed for embedded devices. Git snapshot.'
url="http://monkey-project.org"
license=('GPL2')
arch=('i686' 'x86_64') 
depends=('gcc-libs')
makedepends=('git' 'bash')
optdepends=('php: for PHP support'
            'python: mk_passwd script')
provides=('monkey')
conflicts=('monkey')
source=(rc.d)
md5sums=('1527d1fbddddcfd69ad328639dcd0eed')

_gitroot="git://git.monkey-project.com/monkey"
_gitname="Monkey"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

    cd "$srcdir/$_gitname-build"

    # Don't install the banana script, use OpenRC daemon instead
    sed -i '/install -m 755 bin\/banana/d' configure
    sed -i '/create_banana_script bindir logdir default_port/d' configure
    rm man/banana.1

    # Run monkey as http user
    sed -i '737s/nobody/http/' configure

    ./configure --prefix=/usr \
                --bindir=/usr/bin \
                --sysconfdir=/etc/$_pkgname \
                --mandir=/usr/share/man \
                --datadir=/srv/http \
                --logdir=/var/log/$_pkgname \
                --plugdir=/usr/lib/$_pkgname

    make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install
    install -Dm755 "$srcdir"/rc.d $pkgdir/etc/rc.d/monkey
} 
