pkgname=ttf-inconsolata-gwf-merge
pkgver=1.0
pkgrel=2
pkgdesc='Hinted TrueType Inconsolata including a Bold variant provided by Googlewebfonts.'
arch=('any')
url='https://www.google.com/fonts/'
license=('custom:OFL 1.1')
depends=('fontconfig')
conflicts=('ttf-inconsolata')
provides=('ttf-font')
install='ttf-inconsolata-gwf.install'

source=('http://googlefontdirectory.googlecode.com/hg/ofl/inconsolata/Inconsolata-Regular.ttf'
        'http://googlefontdirectory.googlecode.com/hg/ofl/inconsolata/Inconsolata-Bold.ttf'
        'LICENSE')

md5sums=('9ac6e3d2a7fb76468bd417ea40b6f8c4'
         '819f56653a4197a7959c41ddfc8ff69b'
         '8bd55055b948c7d36f3b1f86eb3b6841')

package() {
    install -Dm644 Inconsolata-Regular.ttf "$pkgdir/usr/share/fonts/TTF/Inconsolata-Regular.ttf"
    install -Dm644 Inconsolata-Bold.ttf "$pkgdir/usr/share/fonts/TTF/Inconsolata-Bold.ttf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ttf-inconsolata-gwf/LICENSE"
}
