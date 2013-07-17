# Maintainer: Bastien Dejean <baskerville@lavabit.com>

pkgname=sortsmill-fontforge
pkgver=2.0.0_alpha1
smver=f4b7cc4
ftver=2.5.0
ftrel=1
pkgrel=7
pkgdesc='An outline and bitmap font editor'
arch=('i686' 'x86_64')
url='https://bitbucket.org/sortsmill/sortsmill-tools'
license=('GPLv3')
groups=('xorg')
depends=('glib' 'pcre' 'gc' 'gsl' 'gmp' 'libunicodenames' 'libatomic_ops' 'guile' 'python2-cython-git' 'python2-gmpy')
optdepends=('pango' 'cairo' 'libunistring' 'libpng' 'libtiff' 'giflib' 'libjpeg' 'libxml2' 'libxcursor' 'libspiro' 'libiconv' 'freetype2')
conflicts=('fontforge')
provides=('fontforge')

source=("https://bitbucket.org/sortsmill/sortsmill-tools/downloads/sortsmill-fontforge-commit-${smver}-snapshot.tar.xz"
        "http://downloads.sourceforge.net/project/freetype/freetype2/${ftver}/freetype-${ftver}.${ftrel}.tar.bz2")
md5sums=('329c23ba1cfd23bde9ed3a193b1256bc'
         'c72e9010b1d986d556fc0b2b5fcbf31a')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --with-freetype-source=../freetype-${ftver}.${ftrel} PYTHON=python2 
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" GUILE_LOAD_PATH="$srcdir/$pkgname-$pkgver/guile" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
