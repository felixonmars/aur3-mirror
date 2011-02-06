# Contributor: A2K <a2k0001@gmail.com>

pkgname=vplayer
pkgver=0.8
pkgrel=0
pkgdesc="Music player aiming to be small and fast"
arch=(i686 x86_64)
url=('http://bitbucket.org/A2K/vplayer')
license="GPL"
depends=('python' 'pyqt' 'qt' 'python-xlib' 'python-chardet' 'mutagen')
source=(http://hell.fr0stb1te.ru/vplayer-08.tgz)
md5sums=(f10c10c443414bcde16a9a9606d46616)
conflicts=('vplayer')
provides=('vplayer')

build()
{
    cd $startdir/src/vplayer
    make uis || exit 1 
    make resources || exit 1
    make translations || exit 1
    python setup.py install --root=$startdir/pkg/ || exit 1
    install -Dm755 vplayer $startdir/pkg/usr/bin/vplayer
    install -Dm644 vplayer.desktop $startdir/pkg/usr/share/applications/vplayer.desktop
    install -Dm644 icon.svg $startdir/pkg/usr/share/pixmaps/vplayer.svg
    install -Dm644 icon.xpm $startdir/pkg/usr/share/pixmaps/vplayer.xpm
    install -Dm644 icon.png $startdir/pkg/usr/share/pixmaps/vplayer.png
}

