pkgname=eclipse-i18n-zh-tw
pkgver=3.7.0.v20110723043401
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://www.eclipse.org/babel"
license=('EPL')
depends=('eclipse>=3.7')
lang='zh_TW'
_url='http://download.eclipse.org/technology/babel/babel_language_packs/R0.9.0/indigo'
source=(
    "${_url}/BabelLanguagePack-eclipse-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-birt-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-modeling.emf.cdo-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-modeling.emft.emf-facet-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-modeling.gmp.graphiti-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-modeling.mdt.modisco-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-mylyn-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-rt.equinox-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-rt.equinox.p2-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.actf-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.bpel-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.egit-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.jgit-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.jubula-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-technology.uomo-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-tools.cdt-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-tools.gef-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-tools.objectteams-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.dali-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.jsdt-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.jsf-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.libra-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.servertools-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.sourceediting-${lang}_${pkgver}.zip"
    "${_url}/BabelLanguagePack-webtools.webservices-${lang}_${pkgver}.zip")
md5sums=(
    '70da660223dc178fff4f09a0db92c4c8'
    'a0d1c1bc5f968ca60a58585f88aaafed'
    'ae2bf42c7f5ad38db58d3d8ace85b9e3'
    'cc9fc1e888c15bf59e9417645e65942d'
    '1249001ef6c03cc5f2689bd7f983f1e7'
    '6c888613764cd5f31c6231acd44ce2a9'
    'b8f81199679f210155cae5ac532cbd0c'
    '25b8d06164244c0527e429c4d09fcc31'
    '566cc413542c767a1469f263e5c6a43c'
    '163c322d2f0f5a2957a648fcf4d61baf'
    'a73fa66522ab0a5995b58e97a92f7d97'
    '6e46c9dcdb7d8be04dbf0f760c0433e6'
    '7d8a9ebc3591cdea298a74893f41a737'
    '41cbf8b48cf1d923ce8efd80e3530379'
    '49a3169bf9f2ef1798f6a490d95bc9a2'
    'ee7f9035fc04bf52726178fb4a897a0a'
    '60d49836279f492d0cee5e44bf638ba6'
    'ee3021f33e60b6042eb5cf3045c29ba9'
    '8322f4292308848fbf6f2b496038211f'
    'dd468e6a36ac3013aa7ee6247a1fb69a'
    '4bfed472c0625d000bd91fcba4bf9f57'
    '4d668bd542a1e249669b15b4ee7b2802'
    '6b827e66be38c93480acd9769a24299b'
    'c3fe96893baa67eb1358b96f5d86f598'
    'f20175ac33c69fb750bb2bb629c35901'
)

build() {
    _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

    cd ${srcdir}/eclipse

    # Features
    find features -type f | while read _feature ; do
        if [[ ${_feature} =~ (.*\.jar$) ]] ; then
            install -dm755 ${_dest}/${_feature%*.jar}
            cd ${_dest}/${_feature/.jar}
            jar xf ${srcdir}/${_feature} || return 1
        else
            install -Dm644 ${_feature} ${_dest}/${_feature}
        fi
    done

    # Plugins
    find plugins -type f | while read _plugin ; do
        install -Dm644 ${_plugin} ${_dest}/${_plugin}
    done
}
