# Maintainer: Krasimir S. Stefanov <lokiisyourmaster@gmail.com> 
# Contributor: lobisquit

pkgname=viget
pkgver=0.2.5
pkgrel=2
pkgdesc='Download and convert videos from site like Youtube and Vimeo'
url="http://download.learnfree.eu/viget/"
arch=('any')
license=('GPL')
depends=('pygtk')
source=("http://download.learnfree.eu/viget/${pkgname}-${pkgver}-linux.tar.gz"
        'viget.desktop' 'viget-gui.py')
md5sums=('020f076a842df2d20ea13bbda95ebd9e'
         '8a09f1f26a740ec65335a78957ef29bf'
         'bf3a452e43d5c3024b384823324bc7f9')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}"/opt/viget/
    cp -ra * "${pkgdir}"/opt/viget/

    # cleanup - ugly workaroud as the tarball has no root
    rm "${pkgdir}"/opt/viget/viget{-gui.py,.desktop}

    install -Dm755 "${srcdir}"/viget-gui.py \
        "${pkgdir}"/opt/viget/viget-gui.py
    install -Dm644 "${srcdir}"/viget.desktop \
        "${pkgdir}"/usr/share/applications/viget.desktop
}
