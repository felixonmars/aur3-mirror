# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Thomas Baechler <thomas at archlinux.org>

pkgname=nvidia-linux-git
pkgver=331.20
_extramodules=extramodules-3.13-git
pkgrel=1
pkgdesc="NVIDIA drivers for linux-git."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-git' "nvidia-utils=$pkgver")
makedepends=('linux-git-headers')
provides=('nvidia')
conflicts=('nvidia' 'nvidia-96xx' 'nvidia-173xx' 'nvidia-304xx')
license=('custom')
install=nvidia.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
  _arch='x86'
  _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
  source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
  md5sums=('801aa04a087891690f1cac09575b2ba9')
elif [ "$CARCH" = "x86_64" ]; then
  _arch='x86_64'
  _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
  source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
  md5sums=('28295eed56c2ca996401c0093279620f')
fi

source+=('patch.txt')
md5sums+=('7e146069c9f09295581201d987a55efd')

prepare() {
  cd "$srcdir"
  sh "$_pkg.run" --extract-only

  # Work around Unknown symbol acpi_os_wait_events_complete
  # https://devtalk.nvidia.com/default/topic/644906/331-20-on-3-13-rc1-kernel/
  cd "$_pkg"
  patch -Np1 -i "${srcdir}/patch.txt"
}

build() {
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  cd "$_pkg/kernel"
  make SYSSRC=/usr/src/"linux-$_kernver/" module
}

package() {
  install -D -m644 "$srcdir/$_pkg/kernel/nvidia.ko" \
      "$pkgdir/usr/lib/modules/$_extramodules/nvidia.ko"
  install -d -m755 "$pkgdir/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" \
    "$startdir/nvidia.install"
  gzip "$pkgdir/usr/lib/modules/$_extramodules/nvidia.ko"
}

# vim:set ts=2 sw=2 et:
