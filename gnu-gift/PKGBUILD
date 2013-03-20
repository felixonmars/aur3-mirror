# Maintainer: Brandon Invergo <brandon@invergo.net>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: BlackEagle <ike.devolder@scarlet.be>

_pkgname=gift
pkgname=gnu-$_pkgname
pkgver=0.1.14
pkgrel=2
pkgdesc="GNU Image Finding Tool"
arch=(i686 x86_64)
url=http://www.gnu.org/software/$_pkgname/
license=(GPL)
depends=(imagemagick perl-xml-xql perl-text-iconv)
options=(!libtool)
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.gz
    01_add-doxy-header-and-footer.diff
    02_gcc-4.0.diff
    03_add-missing-headers.diff
    04_gcc-4.1.diff
    05_gcc-4.3.diff
    06_automake-1.13.1.diff
    07_gcc-4.7.diff
    08_Makefile-duplicates.diff
)
sha256sums=('6a59422f98d8b2fff207263e4d147188a81e88a1ad343b9682df455ecd3f6c38'
    '3ffde702f0d954f1d7fa80a87b2cf47ac15d7f129185f972cb480add0ddf03cb'
    '7b69bd3770cc12f9be1b25675fc3d582ba0d06345e636e8c63d08d1b0e398490'
    '66a7f746c8173d7dd70ea2429aa4815c50af1387e79c4d45f621d41c18b192d7'
    '0c44a41ca2ca92ece8558b9b72d2e0598e9e5ab059f88d9370deedc9f2d81592'
    '1d05436d51bfd157cd9379421e10e3fb063ff6b89d8366d1b1fbaa8e9a8895bd'
    'af80fcb7210ac87e49f34146d27e499e543a34195f79e4e824f0d54459a3c838'
    'd7d2a3928ceab52204e8d2485e35ba5b559448cb066fdf90d3390c170996deae'
    '06bde29d32f98164a4a70d8e0ec1aa9d2cdf3016b0863fbe92ba68fda7148465')
sha512sums=('828a490c6db1e47086e3fe0420ec33ee31a089cb4ff9263479a955bf435e1130995969cb5aeed2a716c64a2b48f7f67df2564d037c5e78dbbece13d03f25724c'
    'a6f27a19fd96a7842a6521edac977e70affde0a7038794bb27dd9b9c677df2ab44603cbe73edd85d96f85197b99002b25e34d10332aff27ca030cb0392e0578c'
    'a936c50206b7da6a5cdc11ff13e3addee6513c51fcfb39bfc6a9a5f238ae2994e3f17f2776240cce58f04085b9f0386466f598d68af896fe649dd78d093e4f93'
    '80a07665c877a24174572570ef5be46ce35cfda3fc62ebcd74349208a0a0278556aa9d3abbe00ae4cadd46e9c32b7688c805371d74dfccc2f0368758502fcefe'
    '74e1e5a24b9e3f41f663994c013318238d1d0251f5f8ad4115c5de918bb56af0275034fc41c60edcfd2d35ee23867f594fb3684748fd201a64d170f2e7f15f96'
    '9dd4a67619870edc0eac7326ea7285eb8ac5e7c52ee7553bd3c0ffb9d7b745f4416a111dc4756af2a2ad6414c3d2169cb62443ceb30d3862cb4c40765d70e2a8'
    'a03dabb7f453a6decc67f9ff41ea59a84dcd7f27b97a930695a751dbdbafe0f55d3b18f7b725ef37831c9341966d39847a7c6e2d8ab1e0d4e69f25a1d1b2a8c5'
'203d10ab5c2f9cb63db66b140489fe90d3c108a174226102223586f9bc12a18c6becb9fb2597c95c791929998313cbaa268df551527225789c2a00c4491b66a0'
'716474ac5f59b39a1ad25d628afbe82a9f6833f703e454fa67402cfaf88281d811f6efdef569460ca597fa6bf5154c648263b006a2c097e2bd1623689a509a79')

build() {
    cd "$srcdir"/$_pkgname-$pkgver/
    patch -Np1 -i ../01_add-doxy-header-and-footer.diff
    patch -Np1 -i ../02_gcc-4.0.diff
    patch -Np1 -i ../03_add-missing-headers.diff
    patch -Np1 -i ../04_gcc-4.1.diff
    patch -Np1 -i ../05_gcc-4.3.diff
    patch -Np1 -i ../06_automake-1.13.1.diff
    patch -Np1 -i ../07_gcc-4.7.diff
    patch -Np1 -i ../08_Makefile-duplicates.diff

    autoreconf --force --install --symlink
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
}
