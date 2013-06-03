# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Maintainer: Drew Liszewski
pkgname=emulationstation-scraper-git
_gitname=ES-scraper
pkgver=c1368b0
pkgrel=1
pkgdesc="A scraper for EmulationStation"
arch=('any')
url="https://github.com/Aloshi/EmulationStation"
license=('WTFPL')
groups=()
makedepends=('git')
depends=('python2>=2.7' 'python2-imaging')
install='emulationstation-scraper.install'
source=('git://github.com/elpendor/ES-scraper.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    mv ./scraper.py ./scraper
    sed -i 's/python/python2/' ./scraper
}

package() {
    cd $_gitname
    install -Dm755 "$srcdir/ES-scraper/scraper" "$pkgdir/usr/bin/scraper"
}
