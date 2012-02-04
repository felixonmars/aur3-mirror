# Maintainer: Philip Belemezov <philip@belemezov>

pkgname=gbgoffice
pkgver=1.4
pkgrel=3
pkgdesc="Bulgarian Dictionary (GTK2), with Debian patches"
arch=('i686' 'x86_64')
url=http://gbgoffice.info/
license=('GPL2' 'unknown')
depends=('libsigc++' 'gtkmm')
source=($pkgname-$pkgver.tar.gz::"http://openfmi.net/frs/download.php/341/$pkgname-$pkgver.tar.gz"
        full-pack.tar.bz2::'http://sourceforge.net/projects/bgoffice/files/Full%20Pack%20of%20Dictionaries/1.0/full-pack.tar.bz2/download'
        06_const-chars.patch
        07_gcc4.3.patch
        08_fix_const_conversion.patch
        09_deprecated_SigC.patch
        10_workhelper-buttonbox.patch
        11_dict_datadir.patch
        gbgoffice.desktop
)
md5sums=(
    'd747bc284f90317fcf4256891a9df381' # gbgoffice-1.4.tar.gz
    '5211fcc86bda7b9a87255aa982d7b135' # full-pack.tar.bz2
    'de1ad6394d99252a8bbc92cf0bc707cd' # 06_const-chars.patch
    '89fc395e4f0f24f600e916ddc1316f03' # 07_gcc4.3.patch
    '51be3d1399eb2005c5c1bc9bc76030b6' # 08_fix_const_conversion.patch
    '6ad23df67f87d1c3b16cdd0a9a31383a' # 09_deprecated_SigC.patch
    'd6516ce9cda7468f87d90f67d6ff2017' # 10_workhelper-buttonbox.patch
    '2b7e148331dd0f2d1f7cca5635f9711b' # 11_dict_datadir.patch
    'e3d4cc323a4060418ffb6518c3472334' # gbgoffice.desktop
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i ../06_const-chars.patch
    patch -p1 -i ../07_gcc4.3.patch
    patch -p1 -i ../08_fix_const_conversion.patch
    patch -p1 -i ../09_deprecated_SigC.patch
    patch -p1 -i ../10_workhelper-buttonbox.patch

    # Dictionaries are looked up in /usr/share/bgoffice by default
    ./configure --prefix=/usr
    make || return 1

    cd "${srcdir}"
    mv full-pack "${pkgname}-${pkgver}-full-pack"
    cd "${pkgname}-${pkgver}-full-pack"
    patch -p1 -i ../11_dict_datadir.patch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install || return 1

    cd "${srcdir}"
    install -D -m 644 gbgoffice.desktop "$pkgdir/usr/share/applications/gbgoffice.desktop"

    cd "${srcdir}/${pkgname}-${pkgver}-full-pack"
    make DATA_DIR="$pkgdir/usr/share/bgoffice" install || return 1
}
