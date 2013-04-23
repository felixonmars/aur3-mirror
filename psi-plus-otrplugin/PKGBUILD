# Contributor: Marat Mukhametshin <mukhametshin[ A__T ]yandex.ru>

pkgname="psi-plus-otrplugin"
pkgver=0.9.5pre
pkgrel=2
pkgdesc="Off-The-Record Plugin for Psi+"
url="https://code.google.com/p/psi-dev/downloads/list?q=otr"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt4' 'psi-plus' 'libotr3' 'tidyhtml')
makedepends=('wget' 'git' 'patch' 'qconf')
source=("https://psi-dev.googlecode.com/files/otrplugin-$pkgver-src.tar.gz"
	)
md5sums=('c0d150bb8a637a5dde587972361aa3f5'
	)

# Plugins list. Includes certain plugins
# * - include all plugins
# Available plugins: http://psi-dev.googlecode.com/svn/trunk/plugins/generic
# Example: plugins_list="image translate"
# includes only imageplugin and translateplugin to package
plugins_list=""
# Use WebKit (http://psi-plus.com/wiki/doku.php/webkit)
# values: (0|1)
usewebkit=0

 
build() {

####fetching and patching psi+ sources
  #sleep 0;pkgrel="archlinux"
  sleep 0;pkgrel=2
  cd $srcdir
  
  PSI_DIR=$srcdir
  SYSLIBDIRNAME="lib"
  ICONSETS="system clients activities moods affiliations roster"
  WORK_OFFLINE=0
  PATCH_LOG="${PSI_DIR}/psipatch.log"
  SKIP_INVALID_PATCH=1
  CONF_OPTS=""
  [ $usewebkit -eq "1" ] && CONF_OPTS="${CONF_OPTS} --enable-webkit"
  INSTALL_ROOT=$pkgdir 
  PLUGINS=$plugins_list
  TRANSLATIONS="ru"
  
  # checkout libpsibuild
  die() { error "$@"; exit 1; }
  if [ ! -f ./libpsibuild.sh -o "$WORK_OFFLINE" = 0 ]; then
    [ -f libpsibuild.sh ] && { rm libpsibuild.sh || die "Delete error"; }
    wget --no-check-certificate "https://raw.github.com/psi-plus/maintenance/master/scripts/posix/libpsibuild.sh" || die "Failed to update libpsibuild";
  fi
  
  . ./libpsibuild.sh
   
  check_env $CONF_OPTS || true
  prepare_workspace || true
  fetch_all || true
  prepare_all || true
  
  revision=$rev
  [ $usewebkit -eq "1" ] && revision="${revision}webkit"
  sleep 0;pkgver=`echo $pkgver | sed "s/latest/$revision/"`


####compile otrplugin only, using required patched psi+ headers
  cd ${srcdir}
  tar -xzvf otrplugin-${pkgver}-src.tar.gz
  mv otrplugin ${srcdir}/build/src/plugins/generic/otrplugin
  cd "${srcdir}/build/src/plugins/generic/otrplugin"

####For the compatibility with ArchLinux we refer to libotr3, not libotr during 
####making. For this reason, we edit the following files with sed as follows:
####(Thanks users dazzy and gay for the hint!)
  mv ./src/otrinternal.h ./src/otrinternal.tmp
  sed "s|libotr|libotr3|g" ./src/otrinternal.tmp > ./src/otrinternal.h
  rm ./src/otrinternal.tmp
  mv ./src/otrlextensions.h ./src/otrlextensions.tmp
  sed "s|libotr|libotr3|g" ./src/otrlextensions.tmp > ./src/otrlextensions.h
  rm ./src/otrlextensions.tmp
  mv ./src/otrlextensions.c ./src/otrlextensions.tmp
  sed "s|libotr|libotr3|g" ./src/otrlextensions.tmp > ./src/otrlextensions.c
  rm ./src/otrlextensions.tmp
  
  qmake-qt4 || return 1

####For the compatibility with ArchLinux we refer to libotr3, not libotr during 
####making. Hence, we edit the Makefile with sed as follows:
####(Thanks users dazzy and gay for the hint!)
  mv ./Makefile ./Makefile.tmp
  sed "s|-lotr|-lotr3|g" ./Makefile.tmp > Makefile
  rm ./Makefile.tmp
  
  make || return 1

}


package() {
	install -D -m644 ${srcdir}/build/src/plugins/generic/otrplugin/libotrplugin.so ${pkgdir}/usr/lib/psi-plus/plugins/libotrplugin.so
}
