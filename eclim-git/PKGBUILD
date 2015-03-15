# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>

pkgname=eclim-git
pkgver=2.4.1.r3.ge91dcb4
pkgrel=1
pkgdesc='Provides the ability to integrate Eclipse code editing features into your favorite editor'
url='http://eclim.org/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('vim' 'eclipse')
makedepends=('apache-ant' 'python2-sphinx')
optdepends=('eclipse-pdt: Eclipse PHP Development Tools support'
            'eclipse-cdt: Eclipse C/C++ Plugin support'
            'eclipse-dltk-core: Eclipse Dynamic Languagues Toolkit support'
            'eclipse-dltk-ruby: Eclipse Ruby support'
            'eclipse-wtp: Eclipse Web Developer Tools support')
conflicts=('eclim')
install=${pkgname}.install
_authorgit=https://github.com/ervandew
source=("${pkgname}::git+${_authorgit}/eclim.git"
        systemd_eclimd.service)
sha256sums=('SKIP'
            'cf6a7fa27097d53891e5cf78bfd97acb86670aa3ddc16c01c13eecdf012dd32e')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"

  sed -i 's|git@github.com:|https://github.com/|' .gitmodules
  git submodule update --init

  # fix build, thanks to mikezackles
  sed -e "s/'sphinx-build'/'sphinx-build2'/g" \
    -e 's|${user.home}/\.|${vim.files}/|g' \
    -e "s|File(getVariable('eclipse')|File('/usr/share/eclipse/'|g" \
    -i ant/build.gant
}

getEclipseUserHome() {
  _eclipse_ver=$(cat /usr/share/eclipse/.eclipseproduct \
    | grep 'version=' \
    | sed -r 's/^version=([0-9\.]+)$/\1/')
  find ~/.eclipse -mindepth 1 -maxdepth 1 -type d -name "org.eclipse.platform_${_eclipse_ver}*" | head -1
}
_eclipse_user_home=$(getEclipseUserHome)
_ant_opts_eclipse_user_home=''
if [ "x${_eclipse_user_home}" != "x" ]; then
  _ant_opts_eclipse_user_home="-Declipse.local=${_eclipse_user_home}"
  echo "Eclipse local home found: ${_eclipse_user_home}"
else
  echo "Could not find Eclipse local home"
fi

build() {
  cd "${srcdir}/${pkgname}"

  # recompiling nailgun to make sure the executable is compliant with our architecture
  pushd org.eclim/nailgun
  ./configure
  make

  popd

  _build_dir=${srcdir}/build
  mkdir -p ${_build_dir}

  ant -Declipse.home=/usr/share/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Declipse.dest=${_build_dir} \
      clean \
      build
}

package() {
  cd "${srcdir}/${pkgname}"

  _build_dir=${srcdir}/build

  ant -Declipse.home=/usr/share/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Declipse.dest=${_build_dir} \
      docs

  mkdir -p ${pkgdir}/usr/share/doc
  cp -r build/doc/site ${pkgdir}/usr/share/doc/eclim

  mkdir -p ${pkgdir}/usr/share/vim/vimfiles/eclim/doc
  ant -Declipse.home=/usr/share/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Dvim.files=${pkgdir}/usr/share/vim/vimfiles \
      -Declipse.dest=${_build_dir} \
      vimdocs

  mkdir -p ${pkgdir}/usr/share/eclipse
  mkdir -p ${pkgdir}/usr/share/vim/vimfiles
  ant -Declipse.home=${pkgdir}/usr/share/eclipse \
      -Declipse.dest=${pkgdir}/usr/share/eclipse \
      -Dvim.files=${pkgdir}/usr/share/vim/vimfiles \
      deploy

  # fix eclim paths
  sed -e "s|${pkgdir}||g" \
    -i ${pkgdir}/usr/share/eclipse/plugins/org.eclim_*/bin/eclimd \
    -i ${pkgdir}/usr/share/eclipse/plugins/org.eclim_*/plugin.properties

  mkdir ${pkgdir}/usr/bin
  for s in eclim eclimd; do
    ln -s /usr/share/eclipse/${s} ${pkgdir}/usr/bin/${s}
  done

  # delete doctrees
  rm -fr ${pkgdir}/usr/share/doc/eclim/.doctrees

  rm ${pkgdir}/usr/share/eclipse/plugins/org.eclim_*/nailgun/config.status

  install -D -m 644 ${srcdir}/systemd_eclimd.service ${pkgdir}/usr/lib/systemd/user/eclimd.service
}
