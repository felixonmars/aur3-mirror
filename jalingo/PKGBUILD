# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=jalingo
pkgver=0.6.0
pkgrel=2
pkgdesc='A dictionary written in Java which supports DSL/Mova/SDict/PtkDict formats'
url='http://jalingo.sourceforge.net'
license=('GPL')
arch=('i686' 'x86_64')
depends=('java-runtime>=5')
makedepends=('p7zip' 'apache-ant>=1.6.5' 'java-environment>=5')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.7z \
		jalingo_file_access.patch \
		jalingo_input_box_position.patch \
		jalingo_look_and_feel.patch \
		jalingo_middle_color.patch)

build() {
	cd ${startdir}/src
	[ ! -d ${pkgname}-${pkgver}-src ] && 7z x ${pkgname}-${pkgver}-src.7z
	cd ${pkgname}-${pkgver}-src
	for i in ../*.patch; do patch -p0 -i ${i} || return $?; done
	[ -z "${JAVA_HOME}" ] && . /etc/profile.d/jdk.sh
	ant || return $?
	mkdir -p ${startdir}/pkg/opt/${pkgname}
	install -m0644 dist/${pkgname}.jar ${startdir}/pkg/opt/${pkgname}/
	install -m0644 build/src.installer/resources/jalingo*x*.png ${startdir}/pkg/opt/${pkgname}/
	echo -e "#!/bin/sh\nexec java -Dja.lingo.laf=com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel -jar '/opt/${pkgname}/${pkgname}.jar'" > ${pkgname}.sh
	install -m0755 -D ${pkgname}.sh ${startdir}/pkg/usr/bin/${pkgname}
}

md5sums=('ef0142d43353bd0b4b6ba56210c07670' '9575cae143b0491723c03709fb66771c' '794033b928c1066b0ae23ca966bed13f' '4e33b545696a463246a277dd68a2788c' 'add512ba769693d822c81d20314f7b51')
