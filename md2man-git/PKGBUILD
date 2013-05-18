# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=md2man
pkgname=${_pkgname}-git
pkgver=v1.6.2z9zg829088a
pkgrel=1
pkgdesc="Markdown to manpage converter"
arch=('i686' 'x86_64')
url="https://github.com/sunaku/md2man"
license=('custom:ISC')
depends=('ruby')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/sunaku/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | tr '-' 'z'
}

build() {
    cd "$srcdir/$_pkgname"
    gem build "${_pkgname}.gemspec"
}

package() {
    cd "$srcdir/$_pkgname"
    local gemdir=$(ruby -e 'puts Gem.default_dir')
    gem install --no-user-install --ignore-dependencies -i "$pkgdir$gemdir" -n "$pkgdir/usr/bin" *.gem
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
