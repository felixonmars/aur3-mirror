# Maintainer : Derek Frank <derek at knarf dot me>

_pkgbase="cheat"
_pkgname="python2-${_pkgbase}"
_pkgbin="py${_pkgbase}"
_license="LICENSE"
_pkglib="cheatsheets"

pkgname="${_pkgname}-git"
pkgver=1
pkgrel=1
pkgdesc='Cheat allows to create and view interactive cheatsheets on the commandline. Git release written in Python2.'
arch=('any')
url="https://github.com/chrisallenlane/$_pkgbase"
_giturl="git://github.com/chrisallenlane/${_pkgbase}.git"
license=('GPL3')
groups=('python', 'python2', 'cheat', 'commandline')
depends=('python2')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install="${_pkgbase}.install"

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

	msg 'Packaging....'
}

package() {
    cd "$srcdir/$pkgname"

    # Run setup
    python2 setup.py install --root="$pkgdir/" --optimize=1

    # Link in bin since conflicting Ruby Gem "cheat"
    #install -Dm755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbin"
    ln -s "/usr/bin/$_pkgbase" "$pkgdir/usr/bin/$_pkgbin"

    # Install libraries
    #install -Dm644 "$_pkglib" "$pkgdir/usr/lib/python2.7/site-packages/$_pkglib"

    # License
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
