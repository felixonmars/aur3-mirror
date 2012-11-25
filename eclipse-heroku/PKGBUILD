# Maintainer: Romain Schmitz <slopjong@archlinux.lu>
#
# PKGBUILD generated with the eclipse-artifacts tool.
#
# Bugs to be filed here:
#
#    https://github.com/slopjong/eclipse-artifacts/issues/new

pkgname=eclipse-heroku
pkgver=1.0.2
pkgrel=1
pkgdesc="Heroku plugin"
arch=('any')
url="https://devcenter.heroku.com/articles/getting-started-with-heroku-eclipse"

# See https://github.com/heroku/heroku-eclipse-plugin/issues/6
license=('MIT')

_eclipseversion=3.7
depends=('eclipse>='"$_eclipseversion"'' 'eclipse-egit')
makedepends=('unzip')

_updatesite="https://eclipse-plugin.herokuapp.com/install/"

source=(
	${_updatesite}'features/com.heroku.eclipse.feature_1.0.1.201210241857.jar' 
	${_updatesite}'plugins/com.heroku.eclipse.core.services.libs_1.0.1.201210241857.jar' 
	${_updatesite}'plugins/com.heroku.eclipse.core.services.rest_1.0.1.201210241857.jar' 
	${_updatesite}'plugins/com.heroku.eclipse.core.services_1.0.1.201210241857.jar' 
	${_updatesite}'plugins/com.heroku.eclipse.ui_1.0.1.201210241857.jar' 
)

noextract=(
	'com.heroku.eclipse.feature_1.0.1.201210241857.jar' 
	'com.heroku.eclipse.core.services.libs_1.0.1.201210241857.jar' 
	'com.heroku.eclipse.core.services.rest_1.0.1.201210241857.jar' 
	'com.heroku.eclipse.core.services_1.0.1.201210241857.jar' 
	'com.heroku.eclipse.ui_1.0.1.201210241857.jar' 
)

md5sums=(
	'0e07991eba73a1359f4b0a5c3a2f0076' 
	'6233fee1c1fc6b327273c48196e7d097' 
	'ee6a02a817bb5e590f15650f869b991f' 
	'20d3119b0316313d3b7a74e96b45cbd0' 
	'b300b69bd053d3a78daace952450026f' 
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

