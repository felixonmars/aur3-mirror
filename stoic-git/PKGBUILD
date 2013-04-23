# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=stoic
pkgname=${_pkgname}-git
pkgver=0.1
pkgrel=1
pkgdesc='A tiny static site generator'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:Unlicense')
depends=('python' 'python-jinja' 'python-yaml' 'python-misaka' 'python-beautifulsoup4')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | tr '-' '.'
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 stoic "$pkgdir/usr/bin/stoic"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
