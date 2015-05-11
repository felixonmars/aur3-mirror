# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-tw_cli
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname='tw_cli'
pkgver='10.2.2.1'
pkgrel=3
pkgdesc='AMCC/3ware Storage Management CLI'
url='http://www.3ware.com'
license=('custom')
arch=('i686' 'x86_64')
source=(
  'dummy::http://www.lsi.com/magic.axd?x=e&file=http%3A//www.lsi.com/downloads/Public/RAID%2520Controllers/RAID%2520Controllers%2520Common%2520Files/CLI_linux-from_the_10.2.2.1_9.5.5.1_codesets.zip'
  'http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/CLI_linux-from_the_10.2.2.1_9.5.5.1_codesets.zip'
  'LICENSE-tw_cli'
)
sha256sums=('e2aca0e749212249a6b1121360e8c0fd91031faef0145e0b653c4cd105911f10'
            '6616ac4c32a9f6c6e810bcbf032d7277506fdb72437433948c5e24deb1f23d9e'
            '068ec6b8c78d842b998e590982ec6273b736174aecdb4424ea3c7c45f180dda6')

package() {
    cd ${srcdir}

    install -Dm755 ${CARCH}/tw_cli "${pkgdir}/usr/bin/tw_cli"
    install -Dm644 tw_cli.8.nroff "${pkgdir}/usr/share/man/man8/tw_cli.8"
    install -Dm644 tw_cli.8.html "${pkgdir}/usr/share/doc/${pkgname}/html/tw_cli.8.html"
    install -Dm644 LICENSE-tw_cli "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
