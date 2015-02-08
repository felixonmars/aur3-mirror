# Maintainer: Kamek <b.kamek@gmail.com>
pkgname=subfetcher-git
pkgver=20150206
pkgrel=2
pkgdesc="A simple CLI subtitles downloader written in Python"
arch=(any)
url="http://zerocore.me"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=()
provides=('subfetcher')
source=('git://github.com/kamek-pf/SubFetcher.git')
md5sums=('SKIP')

_gitname=SubFetcher

pkgver() {
        cd "$srcdir/$_gitname/"
        git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
        cd "$srcdir/$_gitname/"
        python setup.py install --root="$pkgdir/" --optimize=1
}
