# Maintainer : Derek Frank <dmfrank at lavabit dot com>

_pkgbase="macfanctl"
_pkgconf="${_pkgbase}.conf"
_pkgname="${_pkgbase}d"
_license="copyright"
_pkgman="${_pkgname}.1"
_systemd="${_pkgname}.service"

pkgname="${_pkgname}-git"
pkgver=1
pkgrel=11
pkgdesc='Git release for Intel Mac fan control with Systemd support.'
arch=('any')
url="https://github.com/MikaelStrom/$_pkgname"
_giturl="git://github.com/MikaelStrom/${_pkgname}.git"
license=('GPL3')
groups=('apple', 'mac', 'macbook', 'mactel', 'fan')
depends=('glibc')
makedepends=('gcc' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname", "${_pkgname}-bzr")
backup=("etc/$_pkgconf")
install="${_pkgbase}.install"
source=("$_systemd")
md5sums=('54235124edeb7bf7791e24bc5c812290')

build() {
    cd "$srcdir"
    msg 'Connecting to GIT server....'
    if [ -d "$pkgname" ] ; then
        pushd "$pkgname" && git pull origin
        msg 'The local files are updated.'
        popd
    else
        git clone "$_giturl" "$pkgname"
    fi
    msg 'GIT checkout done or server timeout'

    msg 'Making macfanctld....'
    cd "$pkgname"
    make

	msg 'Packaging....'
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # License
    install -Dm644 "debian/$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Config file
    install -Dm644 "$_pkgconf" "$pkgdir/etc/$_pkgconf"

    # Man page
    install -Dm644 "$_pkgman" "$pkgdir/usr/share/man/man1/$_pkgman"

    # Systemd
    cd "$srcdir"
    install -Dm644 "$_systemd" "$pkgdir/usr/lib/systemd/system/$_systemd"
}
