# Maintainer: Ryan Tandy <tarpman@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=eclipse-m2eclipse
pkgver=0.10.2
pkgrel=1
buildid=20100623-1649
pkgdesc="Maven integration in Eclipse"
arch=('i686' 'x86_64')
url="http://m2eclipse.sonatype.org"
license=('EPL')
depends=('eclipse-wtp-wst')
replaces=('eclipse-maven')

source=("${url}/sites/m2e/${pkgver}.${buildid}/features/org.maven.ide.eclipse.feature_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/features/org.maven.ide.eclipse.sdk.feature_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/features/org.maven.ide.eclipse.site_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.archetype_common_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.dependency_tree_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.editor.xml_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.editor_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.integration.tests.common_0.10.0.201006231734.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.jdt_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.launching_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.maven_embedder_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.maven_model_edit_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.nexus_indexer_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.pr_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.refactoring_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse.tests.common_${pkgver}.${buildid}.jar"
    "${url}/sites/m2e/${pkgver}.${buildid}/plugins/org.maven.ide.eclipse_${pkgver}.${buildid}.jar")
noextract=("org.maven.ide.eclipse.feature_${pkgver}.${buildid}.jar"
	"org.maven.ide.eclipse.sdk.feature_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.site_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.archetype_common_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.dependency_tree_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.editor.xml_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.editor_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.integration.tests.common_0.10.0.201006231734.jar"
    "org.maven.ide.eclipse.jdt_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.launching_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.maven_embedder_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.maven_model_edit_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.nexus_indexer_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.pr_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.refactoring_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse.tests.common_${pkgver}.${buildid}.jar"
    "org.maven.ide.eclipse_${pkgver}.${buildid}.jar")

md5sums=('53c6e23f79f4198abc41a6a12319ea3a'
         '2a3af15efed5dd823972698ec42aff50'
         '5bdc95719c0e0bd9aa7fddb717efd4c0'
         '6724464b86b039522d942eb96181823f'
         'e2c7f1f7772c063e96fa8f0acac2ac2d'
         'da5bb3070fc468a18d94b6fb73229634'
         '1f33162fc6559112502cdc1ee2a02840'
         '92efe03d14ac511fc8d26ddbb1de15aa'
         'a35e3e2adb9580d82a0be01a118cf9eb'
         '96b0e23f7aee358e6b352cb87ef60a67'
         '0962019b8e5a4cf0fc700929ba0e57b4'
         '911c3933be26d8de9aa1d81d30d82703'
         'c6d596759ea14ea3551c265a2e411ed3'
         '6e4f16675408672fb5bc9de2f3e51b17'
         '85abd0c4131652cd42474cd36b642cf9'
         '46f5f801a77b76bd177c2546c957a2fd'
         'b5171e7c153a3c8a499e860623645384')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/maven/eclipse

  for url in ${source[@]}
  do 
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    install -dm755 ${_dest}/${_type}/${_file/.jar} 
    cd ${_dest}/${_type}/${_file/.jar}
    jar xf ${srcdir}/${_file} || return 1
  done     
}
# vim:set ts=4 sw=4 et:
