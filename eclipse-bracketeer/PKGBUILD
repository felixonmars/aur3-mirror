# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>

_pkgver=1.1.0
_pkgdate1="201203031719"
_pkgdate2="201307111632-mgodbolt"
_pkgdate3="201112231228"

pkgname=eclipse-bracketeer
pkgver=1.2.0
pkgrel=1
pkgdesc="Bracketeer is a platform used to enrich the editors in Eclipse by coloring the brackets surrounding the cursor & brackets which have no match and showing automatic comments on brackets closing: loops, functions, etc..."
url="https://github.com/chookapp/Bracketeer"
license=("EPL/1.0")
arch=('any')
depends=('eclipse')
makedepends=('unzip')
# noextract=("com.chookapp.org.features.Bracketeer_${pkgver}.${_pkgdate2}.jar"
#            "com.chookapp.org.plugins.Bracketeer_${pkgver}.${_pkgdate2}.jar"
#            "com.chookapp.org.features.BracketeerCDT_${pkgver}.${_pkgdate2}.jar"
#            "com.chookapp.org.plugins.BracketeerCDT_${pkgver}.${_pkgdate2}.jar"
#            "com.chookapp.org.features.BracketeerJDT_${pkgver}.${_pkgdate1}.jar"
#            "com.chookapp.org.plugins.BracketeerJDT_${pkgver}.${_pkgdate1}.jar"
#            "com.chookapp.org.features.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar"
#            "com.chookapp.org.plugins.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar")
source=("com.chookapp.org.features.Bracketeer_${pkgver}.${_pkgdate2}.jar::http://mattgodbolt.github.com/Bracketeer/features/com.chookapp.org.Bracketeer_${pkgver}.${_pkgdate2}.jar"
        "com.chookapp.org.plugins.Bracketeer_${pkgver}.${_pkgdate2}.jar::http://mattgodbolt.github.com/Bracketeer/plugins/com.chookapp.org.Bracketeer_${pkgver}.${_pkgdate2}.jar"
        "com.chookapp.org.features.BracketeerCDT_${pkgver}.${_pkgdate2}.jar::http://mattgodbolt.github.com/Bracketeer/features/com.chookapp.org.BracketeerCDT_${pkgver}.${_pkgdate2}.jar"
        "com.chookapp.org.plugins.BracketeerCDT_${pkgver}.${_pkgdate2}.jar::http://mattgodbolt.github.com/Bracketeer/plugins/com.chookapp.org.BracketeerCDT_${pkgver}.${_pkgdate2}.jar"
        "com.chookapp.org.features.BracketeerJDT_${pkgver}.${_pkgdate1}.jar::http://chookapp.github.com/ChookappUpdateSite/features/com.chookapp.org.BracketeerJDT_${pkgver}.${_pkgdate1}.jar"
        "com.chookapp.org.plugins.BracketeerJDT_${pkgver}.${_pkgdate1}.jar::http://chookapp.github.com/ChookappUpdateSite/plugins/com.chookapp.org.BracketeerJDT_${pkgver}.${_pkgdate1}.jar"
        "com.chookapp.org.features.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar::http://chookapp.github.com/ChookappUpdateSite/features/com.chookapp.org.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar"
        "com.chookapp.org.plugins.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar::http://chookapp.github.com/ChookappUpdateSite/plugins/com.chookapp.org.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar")
noextract=("${source[@]%%::*}")

md5sums=('4095d4f0ca0b403a57ab8c95bce2435d'
         '3865e004214481a851d4901b740a3b4f'
         '3e84b6223e58676f828e64efeecf473a'
         'f857f009842c4f76068c78cd9a864252'
         '4177134bcf21a8e02330d7d80f8cd184'
         '5e4a534b25500440f965cc61766c2b78'
         'de6b29ad14071541c4756fa4677e60d5'
         '208c8d186afab146159a44cd5f50a4b5')

package() {
  _dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  mkdir {plugins,features}
  cp com.chookapp.org.features.Bracketeer_${pkgver}.${_pkgdate2}.jar features/com.chookapp.org.Bracketeer_${pkgver}.${_pkgdate2}.jar
  cp com.chookapp.org.plugins.Bracketeer_${pkgver}.${_pkgdate2}.jar plugins/com.chookapp.org.Bracketeer_${pkgver}.${_pkgdate2}.jar
  cp com.chookapp.org.features.BracketeerCDT_${pkgver}.${_pkgdate2}.jar features/com.chookapp.org.BracketeerCDT_${pkgver}.${_pkgdate2}.jar
  cp com.chookapp.org.plugins.BracketeerCDT_${pkgver}.${_pkgdate2}.jar plugins/com.chookapp.org.BracketeerCDT_${pkgver}.${_pkgdate2}.jar
  cp com.chookapp.org.features.BracketeerJDT_${pkgver}.${_pkgdate1}.jar features/com.chookapp.org.BracketeerJDT_${pkgver}.${_pkgdate1}.jar
  cp com.chookapp.org.plugins.BracketeerJDT_${pkgver}.${_pkgdate1}.jar plugins/com.chookapp.org.BracketeerJDT_${pkgver}.${_pkgdate1}.jar
  cp com.chookapp.org.features.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar features/com.chookapp.org.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar
  cp com.chookapp.org.plugins.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar plugins/com.chookapp.org.OverviewRulerBackground_${_pkgver}.${_pkgdate3}.jar

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}"/${_feature%*.jar}
      cd "${_dest}"/${_feature/.jar}
      jar xf "${srcdir}/${_feature}" || return 1
    else
      install -Dm644 ${_feature} "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} "${_dest}/${_plugin}"
  done
}

# vim:set ts=2 sw=2 et:
