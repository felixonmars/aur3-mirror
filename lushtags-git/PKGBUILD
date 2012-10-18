# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=lushtags-git
pkgver=20121019
pkgrel=1
pkgdesc="Create ctags compatible tags files for Haskell programs"
url="https://github.com/bitc/lushtags"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'ghc' 'haskell-haskell-src-exts' 'haskell-text' 'haskell-vector')
depends=('gmp')
source=()
options=('strip')
#md5sums=()

_gitroot="https://github.com/bitc/lushtags.git"
_gitname="lushtags"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
      cd "$_gitname" && git pull origin
      msg "The local files are updated."
    else
      git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # Change some requirements that are out of date
    sed -ie 's/vector == 0.9.*/vector >= 0.9,/; s/text == 0.11.*/text >= 0.11,/' lushtags.cabal

    # Call haskell configure and build facility
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd "$srcdir/$_gitname-build"
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -D -m644 plugin/tagbar-haskell.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/haskell/tagbar-haskell.vim
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
