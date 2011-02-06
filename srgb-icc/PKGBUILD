# Contributor: foxbunny <bg.branko@gmail.com>

pkgname="srgb-icc"
pkgver="4"
pkgrel=1

pkgdesc="sRGB v4 profile from ICC (International Color Consortium)"
arch=('i686' 'x86_64')
url="http://www.color.org/"
license=('Custom')
source=("http://www.color.org/sRGB_v4_ICC_preference.icc" \
        "http://www.color.org/ICC_White_Paper_26_Using_the_V4_sRGB_ICC_profile.pdf")

md5sums=('a3fe13b83e7cb992f9ecc60c21ed9722' \
         '32b9acd657344d523add51243c67e451')
sha1sums=('3c3c6c65ab8b4ba09d67bcb0edfdc2345e8285dd' \
          '21bdd39da13a0e01791873f9cfee72c5825631bd')

build() {
    cd ${srcdir}
    install -Dm644 sRGB_v4_ICC_preference.icc \
    ${pkgdir}/usr/share/color/icc/sRGB_v4_ICC_preference.icc || return 1
    install -Dm644 ICC_White_Paper_26_Using_the_V4_sRGB_ICC_profile.pdf \
    ${pkgdir}/usr/share/doc/srgb-icc/ICC_White_Paper_26_Using_the_V4_sRGB_ICC_profile.pdf || return 1
}
