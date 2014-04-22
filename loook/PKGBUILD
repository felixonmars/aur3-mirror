# Maintainer: efreak4u <efreak4u@gmx.net>
pkgname=loook
pkgver=0.7.3
pkgrel=1
pkgdesc="Loook is for Full-text search in Open Document Files. Written in Python3"
url="http://mechtilde.de/Loook/"
arch=('any')
license=('GPLv3')
depends=('python' 'tk')
source=("http://mechtilde.de/Loook/Downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c3fa4f97c8ead8c81d6587201e5058ef9d7d7430117200df9b9effb288efb9c3')

package() {
    # Enter Source Directory
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Create Destination Directories
    install -d "${pkgdir}"/usr
    install -d "${pkgdir}"/usr/{bin,lib,lib/loook,share}
    install -d "${pkgdir}"/usr/share/{man/man1,man/de/man1,applications,locale}

    # Copy Look and create Symlink in /usr/bin
    cp -av loook.py "${pkgdir}/usr/lib/loook/loook.py"
    chmod +x "${pkgdir}/usr/lib/loook/loook.py"
    ln -sv /usr/lib/loook/loook.py "${pkgdir}/usr/bin/loook"

    # Copy Messages
    cp -a locale/ "${pkgdir}/usr/share/"

    # Copy Man Pages
    install -m 644 man/loook.1 "${pkgdir}/usr/share/man/man1/loook.1"
    install -m 644 man/de/loook.1 "${pkgdir}/usr/share/man/de/man1/loook.1"

    # Copy .desktop file for executing Loook from application menu
    cp -a loook.desktop "${pkgdir}/usr/share/applications/loook.desktop"
}
