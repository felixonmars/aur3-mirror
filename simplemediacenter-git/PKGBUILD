# Maintainer: Lukas Winkler <derwinlu+aur@gmail.com>

_pkgname=simpleMediaCenter
pkgname=simplemediacenter-git
pkgver=177
pkgrel=1
pkgdesc="a simple Alternative to XBMC, controlled via a webinterface, omxplayer support"
arch=('any')
url="https://github.com/ingwinlu/${_pkgname}"
license=('gplv3')
depends=('python' 'python-pip' 'git')
optdepends=('omxplayer: for video playback on rpi',
            'mplayer: for video playback on other devices',
            'python-jinja2: webinterface',
            'python-turbogears: webinterface2',
            'youtube_dl: youtube playback')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/ingwinlu/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    pip install --install-option='--prefix=/usr' --root="$pkgdir" .
    #python setup.py install --prefix=/usr --root="$pkgdir"
    #install handled by setup.py now
    #install -d "$pkgdir/usr/local/bin/"
    #install -m 755 simpleMC "$pkgdir/usr/local/bin/"
}
