# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=nvidia-total-beta
pkgver=313.18
pkgrel=1
pkgdesc="NVIDIA ~BETA~ drivers, include modules (by DKMS) utilities and libraries (incl. lib32 Multilib)"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA' 'GPL2')
depends=('libxvmc' 'xorg-server' 'dkms' 'gtk2' 'pangox-compat')
[ "$CARCH" = "x86_64" ] && depends+=('lib32-libxext' 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('libx11' 'libxext' 'xextproto')
conflicts=('nvidia'
           'nvidia-utils'  'lib32-nvidia-utils'
           'libgl'         'lib32-libgl'
           'opencl-nvidia' 'lib32-opencl-nvidia'
           'libxnvctrl'
           'opencl')
provides=("nvidia=${pkgver}"
          "nvidia-utils=${pkgver}"  "lib32-nvidia-utils=${pkgver}"
          "libgl=${pkgver}"         "lib32-libgl=${pkgver}"
          "opencl-nvidia=${pkgver}" "lib32-opencl-nvidia=${pkgver}"
          "libxnvctrl=${pkgver}"
          "opencl")
install="${pkgname}.install"
optdepends=("cuda: NVIDIA's GPU programming toolkit"
            'libvdpau: Support for Video Hardware Acceleration'
            'opencl-headers: Headers necessary for OpenCL development'
            'libcl: OpenCL libraies'
            'lib32-libcl: 32bits OpenCL libraies for 64bits systems')
backup=('etc/X11/xorg.conf.d/20-nvidia.conf')
options=('!strip')
source=('20-nvidia.conf' 'nvidia.conf')

[ "$CARCH" = "i686" ] && _arch="x86"
[ "$CARCH" = "x86_64" ] && _arch="x86_64"
_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source+=("http://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
         "http://download.nvidia.com/XFree86/nvidia-settings/nvidia-settings-${pkgver}.tar.bz2")

md5sums=('646e64d99c44eb24b02b28defe182317' 'cddff2da6f6e96b8a48943c8ce62a238')
[ "$CARCH" = "i686" ] && md5sums+=('780c37c28a6e06e9571cafe348b7da64')
[ "$CARCH" = "x86_64" ] && md5sums+=('102140afa822a9f5c486e424b45fcb03')
md5sums+=('441a3130816a1906e719539b8e494376')

build() {
  cd "${srcdir}"

  msg2 "Extract Driver"
  rm -rf "${_pkg}" build
  sh "${_pkg}".run --extract-only
  mv "${_pkg}" build

  msg2 "Build libxnvctrl & nvcontrol-utils"
  rm -fr nvidia-settings-build
  mv "nvidia-settings-${pkgver}" nvidia-settings-build
  cd nvidia-settings-build/src/libXNVCtrl
  make clean
  make
}

package() {
  cd "${srcdir}/build"

  # Copy header in DKMS makepath
  install -d "${pkgdir}/usr/src/nvidia-${pkgver}"
  cp -R kernel/* "${pkgdir}/usr/src/nvidia-${pkgver}"

  # Add Noveau to Blacklist
  install -Dm644 "${srcdir}/nvidia.conf" "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"

  # Install libraries
  # X Driver
  install -Dm755 "nvidia_drv.so" "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

  # OpenGL library
  install -Dm755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.${pkgver}"

  # GLX extension module for X
  install -Dm755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.${pkgver}"
  ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  # OpenGL core library
  install -Dm755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"

  # VDPAU
  install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

  # nvidia-tls library
  install -Dm755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"
  install -Dm755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
  install -Dm755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"

  # X module for wrapped software rendering
  install -Dm755 "libvdpau_trace.so.${pkgver}" "${pkgdir}/usr/lib/libvdpau_trace.so.${pkgver}"

  # OpenCL
  install -Dm644 "nvidia.icd" "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
  install -Dm755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
  install -Dm755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

  # CUDA
  install -Dm755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
  install -Dm755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
  install -Dm755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"

  # Install Binaries
  # nvidia-xconfig
  install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
  install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

  # nvidia-settings
  install -Dm755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
  install -Dm644 nvidia-settings.1.gz "${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz"
  install -Dm644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -Dm644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's|__UTILS_PATH__|/usr/bin|' -e 's|__PIXMAP_PATH__|/usr/share/pixmaps|' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  # nvidia-bug-report
  install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

  # nvidia-smi
  install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
  install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

  # Install license and readme
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia/LICENSE"
  ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-utils"
  ln -s nvidia "${pkgdir}/usr/share/licenses/lib32-nvidia-utils"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
  install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
  install -d "${pkgdir}/usr/share/doc/nvidia/html/"
  install -Dm644 html/* "${pkgdir}/usr/share/doc/nvidia/html/"
  ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

  # Install 32bis libraries if use 64bits
  if [ "$CARCH" = "x86_64" ]; then
   # OpenGL library
   install -Dm755 "32/libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.${pkgver}"

   # OpenGL core library
   install -Dm755 "32/libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}"

   # VDPAU
   install -Dm755 "32/libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

   # nvidia-tls library
   install -Dm755 "32/tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"
   #install -Dm755 "32/libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-cfg.so.${pkgver}"
   install -Dm755 "32/libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}"

   # X module for wrapped software rendering
   install -Dm755 "32/libvdpau_trace.so.${pkgver}" "${pkgdir}/usr/lib32/libvdpau_trace.so.${pkgver}"

   # OpenCL
   install -Dm755 "32/libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${pkgver}"
   install -Dm755 "32/libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

   # CUDA
   install -Dm755 "32/libcuda.so.${pkgver}" "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
   install -Dm755 "32/libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"
   install -Dm755 "32/libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${pkgver}"
  fi

  # Create Sonames
  for _lib in $(find "${pkgdir}" -name '*.so*'); do
    _soname="$(dirname ${_lib})/$(LC_ALL=C readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
    if [ ! -e "${_soname}" ]; then
      ln -s "$(basename ${_lib})" "${_soname}"
      ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
    fi
  done

  # Install nvidia file for xorg autodection
  install -Dm644 "${srcdir}/20-nvidia.conf" "${pkgdir}/etc/X11/xorg.conf.d/20-nvidia.conf"

  # install libXNVCtrl and headers
  cd "${srcdir}/nvidia-settings-build/src/libXNVCtrl"
  install -d "${pkgdir}/usr/include/NVCtrl"
  install -Dm644 nv_control.h NVCtrl{,Lib}.h "${pkgdir}/usr/include/NVCtrl/"
  install -Dm644 libXNVCtrl.a "${pkgdir}/usr/lib/libXNVCtrl.a"
}