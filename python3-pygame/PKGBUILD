# Maintainer: Westley Martínez <anikom15@gmail.com>
pkgname=python3-pygame
pkgver=1.9.1
pkgrel=1
pkgdesc="Python game library"
arch=('i686' 'x86_64')
url="http://www.pygame.org/"
license=('LGPL')
depends=('python' 'sdl_mixer' 'libvorbis' 'sdl_ttf' 'sdl_image' 'smpeg'
         'portmidi')
source=(http://pygame.org/ftp/pygame-${pkgver}release.tar.gz)
md5sums=('1c4cdc708d17c8250a2d78ef997222fc')
build() {
        cd "${srcdir}/pygame-${pkgver}release"
        python3 config.py
}

package() {
        cd "${srcdir}/pygame-${pkgver}release"
        python3 setup.py install --root="${pkgdir}" --prefix=/usr

        # Copying the examples and tests
        cp -R examples lib/* "${pkgdir}/usr/lib/python3.1/site-packages/pygame"
        cp -R test/* "${pkgdir}/usr/lib/python3.1/site-packages/pygame/tests"

        # Fixing permissions
        chmod 644 "${pkgdir}"/usr/include/python3.1/pygame/*
}
