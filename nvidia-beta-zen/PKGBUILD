# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=nvidia-beta-zen
pkgdesc="NVIDIA drivers for linux-zen."
url="http://www.nvidia.com/"
license=('custom')
pkgver=304.51
pkgrel=1
arch=('i686' 'x86_64')

depends=('linux-zen>=3.5' 'linux-zen<3.6' 'xorg-server')

optdepends=('gtk2: for the nvidia-settings work'
            'pkgconfig: for the nvidia-xconfig work'
            'cuda-toolkit: CUDA toolkit with cuda headers'
	        'opencl-headers: OpenCL header files')
	        
provides=('libgl' "nvidia-utils=${pkgver}" "libcl" "opencl-nvidia")
conflicts=('nvidia-173xx-lqx' 'libgl' 'nvidia-utils' 'opencl-nvidia' 'libcl')

options=(!strip)

install=nvidia-zen.install

source=(nvidia-zen.install 20-nvidia.conf)
        
md5sums=('1997831220dd08dfbfe5e0af4e52e1bb'
         '646e64d99c44eb24b02b28defe182317')

_extramodules=extramodules-3.5-zen
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

__mainserver="http://download.nvidia.com"
__ftpserver="ftp://download.nvidia.com"
__usserver="http://us.download.nvidia.com"
__itserver="http://it.download.nvidia.com"
__brserver="http://br.download.nvidia.com"
__currentserver="${__mainserver}"

case $CARCH in
	i686) 	_arch='x86'
			_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
			source+=("${__currentserver}/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
			md5sums+=('4fde294e139a31528ea7f6efd8885a09')
			;;
	x86_64) _arch='x86_64'
			_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
			source+=("${__currentserver}/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
			md5sums+=('2ca10e05cd3b5d2a87caaaad9fd93c06')
			;;
	*)      echo "architecture unrecognized"
			exit 1
			;;
esac

build() {
	cd "${srcdir}"
	rm -rf "${_pkg}"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
	make SYSSRC="/usr/lib/modules/${_kernver}/build" module
}

package() {
	msg2 "Packaging module"
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-zen.conf"
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	
	msg2 "Creating install dirs"
	mkdir -p "${pkgdir}"/usr/{lib,bin,share/applications,share/pixmaps,share/man/man1}
	mkdir -p "${pkgdir}"/usr/lib/xorg/modules/{extensions,drivers}
	mkdir -p "${pkgdir}/usr/lib/vdpau"
	mkdir -p "${pkgdir}/usr/share/licenses/nvidia"
	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	mkdir -p "${pkgdir}/etc/X11/xorg.conf.d"

	cd "${srcdir}/${_pkg}"
	
	msg2 "Packaging OpenCL configuration"
	install nvidia.icd "${pkgdir}/etc/OpenCL/vendors"

	msg2 "Packaging libraries"
	install {libGL,libnvidia-cfg,libnvidia-compiler,libnvidia-glcore,libcuda,tls/libnvidia-tls,libnvidia-wfb,libnvcuvid,libnvidia-ml}.so.${pkgver} "${pkgdir}/usr/lib/"
  	install -m755 libvdpau_nvidia.so.${pkgver} "${pkgdir}/usr/lib/vdpau/"
	install -m755 libOpenCL.so.1.0.0 "${pkgdir}/usr/lib"
	install {libXvMCNVIDIA.a,libXvMCNVIDIA.so.${pkgver}} "${pkgdir}/usr/lib/"
    install nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers"
    install libglx.so.${pkgver} "${pkgdir}/usr/lib/xorg/modules/extensions"

	msg2 "Packaging man pages and License"
	install -m644 nvidia-{settings,xconfig,smi}.1.gz ${pkgdir}/usr/share/man/man1/
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-utils"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
	
	msg2 "Packaging .desktop file"
	install -m644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/"
	sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

	msg2 "Packaging pixmaps"
	install -m644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/"
	
	msg2 "Packaging binaries"
	install -m755 nvidia-{settings,xconfig,smi,bug-report.sh} "${pkgdir}/usr/bin/"

	msg2 "Creating symlinks"
	cd ${pkgdir}/usr/lib/
	ln -s libOpenCL.so.1.0.0 libOpenCL.so.1
	ln -s libOpenCL.so.1 libOpenCL.so
	ln -s libGL.so.${pkgver} libGL.so.1
	ln -s libGL.so.${pkgver} libGL.so
	ln -s libnvidia-glcore.so.${pkgver} libnvidia-glcore.so.1
	ln -s libnvidia-glcore.so.${pkgver} libnvidia-glcore.so
	ln -s libnvidia-cfg.so.${pkgver} libnvidia-cfg.so.1
	ln -s libnvidia-cfg.so.${pkgver} libnvidia-cfg.so
	ln -s libnvidia-compiler.so.${pkgver} libnvidia-compiler.so.1
	ln -s libnvidia-compiler.so.${pkgver} libnvidia-compiler.so
	ln -s libnvidia-tls.so.${pkgver} libnvidia-tls.so.1
	ln -s libnvidia-tls.so.${pkgver} libnvidia-tls.so
	ln -s libcuda.so.${pkgver} libcuda.so.1
	ln -s libcuda.so.${pkgver} libcuda.so
	ln -s libvdpau_nvidia.so.${pkgver} vdpau/libvdpau_nvidia.so.1
	ln -s libvdpau_nvidia.so.${pkgver} vdpau/libvdpau_nvidia.so
	ln -s libnvcuvid.so.${pkgver} libnvcuvid.so.1
	ln -s libnvcuvid.so.${pkgver} libnvcuvid.so
	ln -s libXvMCNVIDIA.so.${pkgver} libXvMCNVIDIA_dynamic.so.1
	ln -s libnvidia-ml.so.${pkgver} libnvidia-ml.so.1
	ln -s libnvidia-ml.so.${pkgver} libnvidia-ml.so
	cd "${pkgdir}/usr/lib/xorg/modules/extensions"
	ln -s libglx.so.${pkgver} libglx.so

	msg2 "Fixing permissions"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
	chmod 644 "${pkgdir}/usr/lib/libXvMCNVIDIA.a"

	msg2 "Packaging nvidia xorg autodetection"
	install -D -m644 $srcdir/20-nvidia.conf "${pkgdir}/etc/X11/xorg.conf.d/20-nvidia.conf"
}
