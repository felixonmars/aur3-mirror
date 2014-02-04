# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=v-rep
pkgver=3.1.0
pkgrel=1
pkgdesc="Virtual robot experimentation platform."
arch=('i686' 'x86_64')
url="http://www.coppeliarobotics.com"
license=('Custom license')
depends=()
optdepends=('bullet: Bullet support'
            'ode: ODE support'
            'ros-hydro-common-msgs: ROS support'
            'ros-hydro-vision-opencv: ROS support'
            'ros-hydro-image-common: ROS support')
makedepends=()

source=("vrep.patch")
md5sums=('d608b5408ba00d6cacbe466a5ff1de82')

_version=`echo ${pkgver} | sed "s/\./_/g"`

if [ "$CARCH" = "i686" ]; then
  _arch=""
  _name="V-REP_PRO_V${_version}${_arch}_Linux"
  source+=("http://coppeliarobotics.com/${_name}.tar.gz")
  md5sums+=('a3d87f366853264c7e1973b825717c51')
elif [ "$CARCH" = "x86_64" ]; then
  _arch="_64"
  _name="V-REP_PRO_V${_version}${_arch}_Linux"
  source+=("http://coppeliarobotics.com/${_name}.tar.gz")
  md5sums+=('fb02d2f2ab5eda3a1efb296336a2c0dc')
fi


build() {
  cd "${srcdir}/${_name}"

  # Patch vrep.sh
  patch -p0 < ${srcdir}/vrep.patch
}

package() {
  cd "${srcdir}/${_name}"

  # Copy everything to /opt/v-rep
  # TODO: cherry-pick relevant files
  install -d ${pkgdir}/opt/v-rep
  cp -r ${srcdir}/${_name}/* ${pkgdir}/opt/v-rep

  # WARNING: v-rep expects write rights on the install folder for some files,
  #          so we just modify the launch script to create those files in /tmp
  #          and create links to those files.
  ln -s /tmp/v-rep/updateCheck.dat "${pkgdir}/opt/v-rep/updateCheck.dat"
  ln -s /tmp/v-rep/debugLog.txt "${pkgdir}/opt/v-rep/debugLog.txt"
  mv "${pkgdir}/opt/v-rep/remoteApiConnections.txt" "${pkgdir}/opt/v-rep/remoteApiConnections.txt.default"
  ln -s /tmp/v-rep/remoteApiConnections.txt "${pkgdir}/opt/v-rep/remoteApiConnections.txt"
  ln -s /tmp/v-rep/system/settings.dat "${pkgdir}/opt/v-rep/system/settings.dat"
  mv "${pkgdir}/opt/v-rep/system/usrset.txt" "${pkgdir}/opt/v-rep/system/usrset.txt.default"
  ln -s /tmp/v-rep/system/usrset.txt "${pkgdir}/opt/v-rep/system/usrset.txt"

  # Thumbnails
  find . -type f -iname "v_repModelThumbnails.ttmt" | while read file
  do
    mv "${pkgdir}/opt/v-rep/${file}" "${pkgdir}/opt/v-rep/${file%.ttmt}.ttmt.default"
    ln -s "/tmp/v-rep/${file}" "${pkgdir}/opt/v-rep/${file}"
  done

  chmod a+x "${pkgdir}/opt/v-rep/vrep.sh"
}

# vim:set ts=2 sw=2 et:
