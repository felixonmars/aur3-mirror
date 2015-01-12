# Maintainer: Ricardo Band <xengi@mailbox.org>
pkgname=djboxsym
pkgver=1
pkgrel=1
pkgdesc="The djboxsym program is a tool for quickly producing a gschem symbol from a minimal description. Yes, it's like tragesym, with a few differences."
arch=('any')
url="http://www.gedasymbols.org/user/dj_delorie/tools/djboxsym.html"
license=('GPLv2')
depends=('perl')
provides=('djboxsym')
source=("http://www.gedasymbols.org/user/dj_delorie/tools/djboxsym"
        "http://www.gedasymbols.org/user/dj_delorie/tools/sample.symdef"
        "http://www.gedasymbols.org/user/dj_delorie/tools/sample.sym")
sha256sums=('1a372fdef8e474119fae8acde38226f82271b62cd16b7f47b6b2408f0c0dd1ea'
            '7cf7d207b1871539daf4c6606eefa503e5b5389141b5af9bae414bf17ac6abf7'
            'SKIP')  # webserver sends 2 versions of the file. Only difference is a date in the header 

package() {
    cd "$srcdir/"
    install -D -m755 djboxsym "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 sample.symdef "${pkgdir}/usr/share/doc/${pkgname}/sample.symdef"
    install -D -m644 sample.sym "${pkgdir}/usr/share/doc/${pkgname}/sample.sym"
}
