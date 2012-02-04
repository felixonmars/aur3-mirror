# Maintainer: kozec <kozec-at-kozec-dot-com>
# Copied from python-pymedia package by TDY <tdy@gmx.com>

pkgname=python2-pymedia
pkgver=1.3.7.3
pkgrel=1
pkgdesc="A Python2 library for accessing and manipulating multimedia files"
arch=('i686' 'x86_64')
url="http://pymedia.org/"
license=('LGPL')
depends=('alsa-lib' 'ffmpeg' 'python2')
optdepends=('faad2:     AAC support'
            'lame:      MP3 support'
            'libogg:    Ogg support'
            'libvorbis: Vorbis support')
source=(http://downloads.sourceforge.net/pymedia/pymedia-1.3.7.3.tar.gz
        pymedia-1.3.7.3-amd64-gentoo.diff
        missing-includes.patch
        )

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  patch -Np1 -i ../pymedia-1.3.7.3-amd64-gentoo.diff || return 1
  patch -Np0 -i "../missing-includes.patch" || return 1
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

md5sums=('2f4930c63866c97af5090b176e2a118a'
         '3137e65e1208db98e404ee894fcd744a'
         '5a1f38f2e33227b400fcf9cdd87a5b72')
