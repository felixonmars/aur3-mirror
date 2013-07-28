# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Hugo Ideler <hugoideler@dse.nl>

pkgname=slim-arched
_pkgname=slim
pkgver=1.3.5
pkgrel=1
_themename=archlinux-themes-slim
_themever=1.2
pkgdesc="SLiM with PAM fix and a single Arch-branded theme"
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2' 'CCPL:cc-by-sa')
provides=(slim)
conflicts=(slim)
depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'xorg-xauth')
makedepends=('cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
source=(http://download.berlios.de/$_pkgname/$_pkgname-$pkgver.tar.gz
    "ftp://ftp.archlinux.org/other/artwork/${_themename}-${_themever}.tar.gz"
    slim.pam
    slim.logrotate)
sha256sums=('818d209f51e2fa8d5b94ef75ce90a7415be48b45e796d66f8083a9532b655629'
            'dcbcd85d62ed140f35462290abeeadf773cd763960fb4b8f0e0c6c674da3e813'
            '57c0468bc8f62ab7a26a70e7da012c839dc6f2f97075ece8cc01d8a34dc96a98'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def')

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Fix installation path of slim.service
    sed -i 's|usr/lib/systemd/system|/&|' CMakeLists.txt

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DUSE_PAM=yes \
        -DUSE_CONSOLEKIT=no
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
    install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"

    # Provide sane defaults
    sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
        -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
        "$pkgdir/etc/slim.conf"

    # Replace default theme with my favourite Arch-branded one.
    cd $srcdir/${_themename}-${_themever}
    mkdir -p $pkgdir/usr/share/slim/themes
    rm -r $pkgdir/usr/share/slim/themes/default
    cp -a archlinux-darch-white/ $pkgdir/usr/share/slim/themes/default
}

