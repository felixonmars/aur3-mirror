# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=later
pkgname=$_pkgname-git
pkgver=20130513.9
pkgrel=1
pkgdesc='A script that saves and manages URLs to be opened later.'
arch=('any')
url='https://github.com/supplantr/later'
license=('GPL3')
depends=('perl')
makedepends=('git')
optdepends=('curl: URL title support' 'perl-html-parser: URL title support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://github.com/supplantr/later.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 later "$pkgdir/usr/bin/later"
}
