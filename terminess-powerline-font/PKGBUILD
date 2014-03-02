# Maintainer: Wesley Merkel <ooesili@gmail.com>

pkgname=terminess-powerline-font
_gitname=powerline-fonts
pkgver=1ceb8dc
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
url=('https://github.com/Lokaltog/powerline-fonts')
license='custom'
pkgdesc="Terminus patched for Powerline users"
arch=('any')
source=("git://github.com/Lokaltog/${_gitname}.git")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    git describe --always | sed 's|-|.|g'
}

package() {
    cd $_gitname/Terminus
    install -dm755 $pkgdir/usr/share/{kbd/consolefonts,fonts/local}
    install -m644 PSF/*.psf.gz "$pkgdir/usr/share/kbd/consolefonts"
    for _pcf in PCF/*.pcf.gz; do
        install -m644 $_pcf\
            "$pkgdir/usr/share/fonts/local/ter-powerline-${_pcf##*ter-}"
    done
    install -Dm644 LICENSE.txt\
        "$pkgdir/usr/share/licenses/terminess-powerline-font/LICENSE"
}

