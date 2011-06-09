# Original PKGBUILD: lib32-nvidia-utils-180.29-3 by Florian Joncour aka Diablo150
# Derived from lib32-nvidia-utils-173.14.20-1 by Christofer Bertonha (ghost-linux)
# Contributor Viktor Jackson (Xlator)

pkgname=lib32-nvidia-utils-96xx
pkgver=96.43.19
pkgrel=1
pkgdesc="Legacy (96xx) x86 NVIDIA drivers utilities and libraries for x86_64 systems."
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('lib32-libxext')
conflicts=('lib32-libgl' 'lib32-ati-fglrx-utils' 'lib32-nvidia-utils' 'lib32-nvidia-utils-beta ')
provides=('lib32-libgl' 'lib32-nvidia-utils')
options=('docs' '!strip')

# Avoid repeting this long name every time
_nvidia="NVIDIA-Linux-x86-${pkgver}-pkg${pkgrel}"

source=("ftp://download.nvidia.com/XFree86/Linux-x86/$pkgver/$_nvidia.run")
md5sums=('59036f8c75868c5c918316caa0af4a5e')

package()
{
  cd $srcdir
  rm -rf $_nvidia
  sh ${_nvidia}.run --extract-only
  cd "${srcdir}/${_nvidia}"
  mkdir -p $pkgdir/usr/lib32
  cp -dp usr/lib/*.so* $pkgdir/usr/lib32
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  cd $pkgdir/usr/lib32
  ln -sf libGL.so.$pkgver libGL.so
  ln -sf libGL.so.$pkgver libGL.so.1
  ln -sf libGLcore.so.$pkgver libGLcore.so.1
  ln -sf libnvidia-cfg.so.$pkgver libnvidia-cfg.so.1
  ln -sf libnvidia-tls.so.$pkgver libnvidia-tls.so.1
}

