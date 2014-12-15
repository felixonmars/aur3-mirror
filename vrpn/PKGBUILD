# Maintainer: Kniyl <mathias(dot)ettinger(at)gmail(dot)com>

pkgname=vrpn
pkgver=07.32
pkgrel=1
pkgdesc='the Virtual Reality Peripheral Network lib and tools'
arch=('i686' 'x86_64')
url="http://www.cs.unc.edu/Research/vrpn"
license=('GPL')
depends=('gpm' 'libusbx')
makedepends=('cmake')
source=("http://www.cs.unc.edu/Research/${pkgname}/downloads/${pkgname}_${pkgver//./_}.zip"
        'vrpn.rc.patch')
md5sums=('6cb32e51e6420385f2006f1aae58b457'
         '1500eed51edfd173a9c9cb599df5df83')

prepare() {
  cd "${srcdir}/${pkgname}/server_src"

  msg "Fixing vrpn.cfg path finding"
  sed -i 's|"vrpn.cfg"|"/etc/vrpn.cfg"|' \
    aureal_sound_server/vrpn_Sound_A3D.cpp \
    ausim_sound_server/vrpn_Sound_ASM.cpp \
    directx_sound_server/vrpn_Sound_DX9.cpp \
    miles_sound_server/v5.0/sound_server.cpp \
    miles_sound_server/v6.0/sound_server.cpp \
    vrpn.C \
    vrpn_Generic_server_object.h
  msg "Fixing -f option help text"
  sed -i 's|default vrpn.cfg|default /etc/vrpn.cfg|' vrpn.C
  #TODO: Deprecated, create a service file instead
  msg "Fixing vrpn.rc mechanisms"
  patch -i "${srcdir}/vrpn.rc.patch"
}

build(){
  cd "${srcdir}"
  [[ "${pkgname}-build" ]] && rm -rf "${pkgname}-build"
  mkdir "${pkgname}-build"
  cd "${pkgname}-build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DVRPN_BUILD_CLIENTS=ON \
    -DVRPN_BUILD_CLIENT_LIBRARY=ON \
    -DVRPN_BUILD_EXTRA_COMPILER_WARNINGS=ON \
    -DVRPN_BUILD_HID_GUI=OFF \
    -DVRPN_BUILD_JAVA=OFF \
    -DVRPN_BUILD_PROFILING_SUPPORT=OFF \
    -DVRPN_BUILD_PYTHON=OFF \
    -DVRPN_BUILD_PYTHON_HANDCODED_2X=OFF \
    -DVRPN_BUILD_PYTHON_HANDCODED_3X=OFF \
    -DVRPN_BUILD_SERVERS=ON \
    -DVRPN_BUILD_SERVER_LIBRARY=ON \
    -DVRPN_BUILD_TEST_RPC_GENERATION=OFF \
    -DVRPN_GPL_SERVER=ON \
    -DVRPN_HIDAPI_USE_LIBUSB=ON \
    -DVRPN_HID_DEBUGGING=OFF \
    -DVRPN_INCLUDE_INTERSENSE=OFF \
    -DVRPN_INCLUDE_PHASESPACE=OFF \
    -DVRPN_USE_DEV_INPUT=ON \
    -DVRPN_USE_FREESPACE=OFF \
    -DVRPN_USE_GHOST=OFF \
    -DVRPN_USE_GPM_MOUSE=ON \
    -DVRPN_USE_HDAPI=OFF \
    -DVRPN_USE_HID=ON \
    -DVRPN_USE_JOYLIN=ON \
    -DVRPN_USE_JSONNET=OFF \
    -DVRPN_USE_LIBNIFALCON=OFF \
    -DVRPN_USE_LIBUSB_1_0=ON \
    -DVRPN_USE_LOCAL_HIDAPI=ON \
    -DVRPN_USE_LOCAL_JSONCPP=ON \
    -DVRPN_USE_MICROSCRIBE=OFF \
    -DVRPN_USE_MOTIONNODE=OFF \
    -DVRPN_USE_MPI=OFF \
    -DVRPN_USE_NATIONAL_INSTRUMENTS=OFF \
    -DVRPN_USE_NATIONAL_INSTRUMENTS_MX=OFF \
    -DVRPN_USE_NIDAQ=OFF \
    -DVRPN_USE_PHANTOM_SERVER=OFF \
    -DVRPN_USE_TRIVISIOCOLIBRI=OFF \
    -DVRPN_USE_USDIGITAL=OFF \
    -DVRPN_USE_VIEWPOINT=OFF \
    -DVRPN_USE_WIIUSE=OFF \
    "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-build"

  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/etc" "$pkgdir"
}
