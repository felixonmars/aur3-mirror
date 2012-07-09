# Maintainer: Romain Schmitz <myself at slopjong dot de>
#
# PKGBUILD generated with the eclipse-artifacts tool.
#
# Bugs to be filed here:
#
#    https://github.com/slopjong/eclipse-artifacts/issues/new

pkgname=eclipse-codecover
pkgver=1.0.1.2
pkgrel=1
pkgdesc="Code coverage measurement tool."
arch=('any')
url="http://codecover.org"
license=('EPL')
_eclipseversion=3.5
depends=('eclipse>='"$_eclipseversion"'' )
makedepends=('unzip')

_updatesite="http://codecover.org/eclipse-site/"

source=(
	${_updatesite}'features/codecover_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.eclipse_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.instrumentation.java.junit_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.instrumentation.java.measurement_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.instrumentation.java_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.instrumentation_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.metrics_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.model_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.report.csv_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.report.html_1.0.1.2.jar' 
	${_updatesite}'plugins/org.codecover.report_1.0.1.2.jar' 
)

noextract=(
	'codecover_1.0.1.2.jar' 
	'org.codecover.eclipse_1.0.1.2.jar' 
	'org.codecover.instrumentation.java.junit_1.0.1.2.jar' 
	'org.codecover.instrumentation.java.measurement_1.0.1.2.jar' 
	'org.codecover.instrumentation.java_1.0.1.2.jar' 
	'org.codecover.instrumentation_1.0.1.2.jar' 
	'org.codecover.metrics_1.0.1.2.jar' 
	'org.codecover.model_1.0.1.2.jar' 
	'org.codecover.report.csv_1.0.1.2.jar' 
	'org.codecover.report.html_1.0.1.2.jar' 
	'org.codecover.report_1.0.1.2.jar' 
)

md5sums=(
	'9cc5ae7d6e5341b8ee4264471f96005d' 
	'4a56028bee4ca996d11e28cece726f15' 
	'613e8869f90019cb6bb33c3e13f2938d' 
	'aa06f4cb2811309bfd0b81a4c3007717' 
	'fefdcef2476d045cdb650f750f3665e4' 
	'0a239db3a354e42a9a122ff2459883a0' 
	'be7413a2fbced98e01cc0398d7857465' 
	'2472fd214a8f3aad709ef9bfb33d3ca8' 
	'5aa2c465201d67972c46fa29fff2eb14' 
	'89878849e3f3f605c06839078636ddf9' 
	'3efd279993d77255fd25c758547f5853' 
)


build()
{
    return 0;
}

package()
{    
    _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
    mkdir -p ${_dest}/{features,plugins}

    for ((i=0; i < ${#source[@]}; i++))
    do
        # remove the update site from the source
        source[$i]=${source[$i]/${_updatesite}}
        # get the folder where the source belongs to
        folder=${source[$i]/\/${noextract[$i]}}
        # remove the folder from the source
        source[$i]=${source[$i]/${folder}\/}
        # install the source
        install -m644 ${source[$i]} ${_dest}/${folder}
    done  
}

