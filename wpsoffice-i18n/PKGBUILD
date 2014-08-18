# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

lang=(de fr fr-ca ja-jp zh-cn zh-tw)
_prefix="wps-office-mui"
_srcurl="http://kdl.cc.ksosoft.com/wps-community/download/a15/${_prefix}"
_pkgver=9.1.0.4751~a15

pkgbase=wpsoffice-i18n
pkgname=('wpsoffice-de'
         'wpsoffice-fr'
         'wpsoffice-fr-ca'
         'wpsoffice-ja-jp'
         'wpsoffice-zh-cn'
         'wpsoffice-zh-tw')
pkgver=${_pkgver}
pkgrel=1
arch=('any')
groups=('wpsforlinux')
url='http://wps-community.org/'
license=('custom:Kingsoft')
depends=('wpsoffice')
conflicts=('wps-office' 'kingsoft-office')
provides=('wpsoffice-langpack')
source=("${_srcurl}-de_${_pkgver}_all.deb"
        "${_srcurl}-fr_${_pkgver}_all.deb"
        "${_srcurl}-fr-ca_${_pkgver}_all.deb"
        "${_srcurl}-ja-jp_${_pkgver}_all.deb"
        "${_srcurl}-zh-cn_${_pkgver}_all.deb"
        "${_srcurl}-zh-tw_${_pkgver}_all.deb")
sha1sums=('bcf82427f31141868c5d390352e175f4cfc797cf'
          '894928a69ab46ce94932fa302aa9392b98eb0553'
          '2ebfef6b9d2e7db79302cf84f6f185f6be1c7716'
          '29c58a2d7ed5b4b73b876a88f0ef2b7a67527bba'
          'e1bf24a301c4b735f572b704a8c67ade35dfc650'
          '422916c88d7968f9d1d247db72749af89d5f2aa9')
noextract=(${source[@]##*/})

build(){
    cd "${srcdir}"
    for _lang in ${lang[@]}; do
        [ -d $_lang ]&&rm -r $_lang
        mkdir $_lang
        bsdtar -xf ${_prefix}-${_lang}_${_pkgver}_all.deb
        mv control.tar.gz  data.tar.xz  debian-binary $_lang/
    done
}

package_wpsoffice-de() {
    pkgdesc='German language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f de/data.tar.xz
}

package_wpsoffice-fr() {
    pkgdesc='French language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f fr/data.tar.xz
}

package_wpsoffice-fr-ca() {
    pkgdesc='French(Canada) language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f fr-ca/data.tar.xz
}

package_wpsoffice-ja-jp() {
    pkgdesc='Japanese language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f ja-jp/data.tar.xz
}

package_wpsoffice-zh-cn() {
    pkgdesc='Chinese (simplified) language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f zh-cn/data.tar.xz
}
package_wpsoffice-zh-tw() {
    pkgdesc='Chinese (traditional) language pack for WPS Office.'

    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f zh-tw/data.tar.xz
}
