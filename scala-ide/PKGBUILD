# Maintainer: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=scala-ide
pkgver=2.0.0beta12
pkgrel=5
pkgdesc="Scala IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.scala-ide.org/"
license=('custom')
depends=('eclipse>=3.7')
optdepends=('eclipse-ajdt: aspect weaving support')
noextract=(${source[@]##*/})

source=(\
http://download.scala-ide.org/releases/2.0.0-beta/features/org.scala-ide.sdt.feature_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/features/org.scala-ide.sdt.source.feature_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.sbt.full.library_0.11.3.2_09-20111031-0501.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.scala.compiler_2.9.2.r25900-b20111028042233.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.scala.library_2.9.2.r25900-b20111028042233.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.sdt.aspects.source_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.sdt.aspects_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.sdt.core.source_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-ide.sdt.core_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/org.scala-refactoring.library_0.3.0.201110310505.jar \
http://download.scala-ide.org/releases/2.0.0-beta/plugins/scalariform_0.1.2.201110310507.jar \
LICENSE)

md5sums=( \
'357e613edf5a5930f71276808823e8f1' \
'1b1c358ed41565ca4128aef80108ad88' \
'22bb02bb22277d33d8bc174817b51945' \
'49cd7c6080be13013b17b3126a7f1f97' \
'916c10adaa38f13108bf21e80152bbbc' \
'e7358c43d1ab94104491b2df8635effb' \
'32b1ef83abfa619e527fd58365041502' \
'0b1fe87dbc9366a73f49acf416b9b541' \
'08f28c45d6dd624661f1aefe8166122c' \
'7b51ef6285e058b54629448b904cf961' \
'f8949e45c219ec4cc36e9818650bce9e' \
'58b225f304aaf42c8b8738894a10cb96')

build() {
  mkdir -p $pkgdir/usr/share/eclipse/dropins/scala-ide/eclipse/features
  mkdir -p $pkgdir/usr/share/eclipse/dropins/scala-ide/eclipse/plugins

  install -m644 org.scala-ide.sdt.feature_2.0.0.beta12-2_09-201110310936-87d1fd5.jar $pkgdir/usr/share/eclipse/dropins/scala-ide/eclipse/features/
  install -m644 org.scala-ide.sdt.source.feature_2.0.0.beta12-2_09-201110310936-87d1fd5.jar $pkgdir/usr/share/eclipse/dropins/scala-ide/eclipse/features/
  
  for i in \
org.scala-ide.sbt.full.library_0.11.3.2_09-20111031-0501.jar \
org.scala-ide.scala.compiler_2.9.2.r25900-b20111028042233.jar \
org.scala-ide.scala.library_2.9.2.r25900-b20111028042233.jar \
org.scala-ide.sdt.aspects_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
org.scala-ide.sdt.aspects.source_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
org.scala-ide.sdt.core_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
org.scala-ide.sdt.core.source_2.0.0.beta12-2_09-201110310936-87d1fd5.jar \
org.scala-refactoring.library_0.3.0.201110310505.jar \
scalariform_0.1.2.201110310507.jar \
; do 
    install -m644 $i $pkgdir/usr/share/eclipse/dropins/scala-ide/eclipse/plugins/; \
  done

  install -D -m0644 $startdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
