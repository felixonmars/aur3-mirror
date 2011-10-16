pkgname=eclipse-zkstudio
pkgver=1.0.1.v2011060311914
pkgrel=2
pkgdesc="ZK Studio plugin for Eclipse, Java web application UI design, prototyping and development tools"
arch=('i686' 'x86_64')
url="http://www.zkoss.org/product/zkstudio"
license=('custom')
depends=('eclipse>=3.5' 'eclipse-wtp')
_url='http://studioupdate.zkoss.org/studio/update'
source=(
    "${_url}/features/org.zkoss.eclipse_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse35.services_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.brand_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.editor_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.pack_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.services_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.setting_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.style_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.ve_${pkgver}.jar"
    "${_url}/plugins/org.zkoss.eclipse.zks_${pkgver}.jar")
md5sums=(
    'cba63f945469617dbd9d47db8eac7aae'
    '82c452a97032c1a38df84c491e4f61db'
    'c199060f32eb49ea3c601895928d83af'
    '9c4006c065ca76da81ba844dcfa9c279'
    '1ee39c38c833c9f930563fcb0550e932'
    '22c9ea537cfae137bf66f9cd0c2ffa35'
    '6bf7d4e4dba961e6ee203c135cd90a92'
    '49803f7e7a1e37bec2c289b6cc0e9dc7'
    '7ffba1b134b63a37ed0339521bae5311'
    '75e724416148e88f1171f321c06afc3c')
noextract=(${source[@]##*/})

build() {
    _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

    cd ${srcdir}

    ls -1 | while read _f ; do
        echo $_f
        if [[ ${_f} =~ (.*eclipse_.*$) ]] ; then
            install -dm755 ${_dest}/features/${_f%*.jar}
            cd ${_dest}/features/${_f/.jar}
            jar xf ${srcdir}/${_f} || return 1
        else
            install -Dm644 ${srcdir}/${_f} ${_dest}/plugins/${_f}
        fi
    done
}
