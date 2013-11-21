_name=SensorKinect
pkgname=sensorkinect-git
pkgver=40.94d6ed3
pkgrel=1
pkgdesc="PrimeSensor Modules for OpenNI"
arch=('i686' 'x86_64')
url="https://github.com/avin2/SensorKinect"
license=('GPL')
#depends=('openni-git')
depends=('openni')
provides=(sensorkinect)
conflicts=(sensorkinect)
install=sensorkinect.install
source=("git+https://github.com/ph4m/$_name.git#branch=unstable")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_name/Platform/Linux/Build"
  make NI_CONF_DIR=/etc || return 1
}

package() {
  install -d -m755 ${pkgdir}/usr/{lib,bin}

  cd $srcdir/$_name/Platform/Linux/Bin/
  [[ "${CARCH}" = "x86_64" ]] && cd x64-Release || cd x86-Release
  install XnSensorServer ${pkgdir}/usr/bin
  install libXnCore.so libXnDDK.so libXnDeviceFile.so libXnDeviceSensorV2KM.so libXnFormats.so ${pkgdir}/usr/lib
  chmod +s ${pkgdir}/usr/bin/XnSensorServer

  cd $srcdir/$_name/Platform/Linux/Install
  install -d -m755 ${pkgdir}/etc/udev/rules.d
  sed -i 's/SYSFS/ATTR/g' 55-primesense-usb.rules
  install 55-primesense-usb.rules ${pkgdir}/etc/udev/rules.d

  cd $srcdir/$_name/Data
  install -d -m755 ${pkgdir}/etc/primesense
  install GlobalDefaultsKinect.ini ${pkgdir}/etc/primesense

  install -d -m777 ${pkgdir}/var/log/primesense/XnSensorServer 
}
