# Maintainer : Derek Frank <dmfrank at lavabit dot com>

_pkgbase="python-shell-enhancement"
_pkgname="${_pkgbase}"
_pkgscript="pythonstartup.py"
_license="LICENSE"

pkgname="${_pkgname}-git"
pkgver=1
pkgrel=5
pkgdesc='Git release script to add history and basic tab completion to the Python interpreters.'
arch=('any')
url="https://github.com/jbisbee/$_pkgname"
_giturl="git://github.com/jbisbee/${_pkgname}.git"
license=('MIT')
groups=('python', 'auto-completion', 'history', 'interpreter')
optdepends=('python' 'python2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
    install -Dm755 "$_pkgscript" "$pkgdir/usr/share/$_pkgname/$_pkgscript"

    # License
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
