# Contributor: Kirt Lillywhite <kirt.lillywhite@gmail.com>
pkgname=the-vnb
pkgver=0.1.1
pkgrel=2
pkgdesc="A PyGtk application for downloading movie info and saving it to a NFO file. Works great in conjunction with XBMC"
arch=('i686' 'x86_64')
url="http://github.com/kfrance/The-VNB"
license=('GPLv3')
depends=('pygtk' 'imdbpy' 'pyxdg')
source=(https://github.com/downloads/kfrance/The-VNB/${pkgname}-${pkgver}.tar.gz)
md5sums=(19a1ed154b52fd71ab94405598bebde8)


build() {
    cd ${srcdir}/${pkgname}
    #python setup.py install --prefix=/usr --root=${pkgdir} || return 1
    install -D -m755 the-vnb ${pkgdir}/usr/bin/the-vnb
    install -D -m644 README ${pkgdir}/usr/share/the-vnb/README
    install -D -m644 clapper.png ${pkgdir}/usr/share/the-vnb/clapper.png
    install -D -m644 no_poster.png ${pkgdir}/usr/share/the-vnb/no_poster.png
    install -D -m644 no_fanart.png ${pkgdir}/usr/share/the-vnb/no_fanart.png
    install -D -m644 the-vnb.glade ${pkgdir}/usr/share/the-vnb/the-vnb.glade
    install -D -m644 the-vnb.desktop ${pkgdir}/usr/share/applications/the-vnb.desktop
}
