# Maintainer: Backfist <chalvadori@gmx.de>

pkgname=nvml_fix-git
_gitname=nvml_fix
pkgver=1
pkgrel=1
pkgdesc="A workaround for an annoying bug in nVidia's NVML library. Allows nvidia-smi to work once more!"
arch=('i686' 'x86_64')
url="https://github.com/CFSworks/nvml_fix"
license=('Public domain')
depends=('nvidia' 'nvidia-utils')
makedepends=('git')
optdepends=()
provides=()
conflicts=('nvidia-smi-fix')
source=('git+https://github.com/CFSworks/nvml_fix')
md5sums=('SKIP')

_optimal_make_jobs() {
	if [ -r /proc/cpuinfo ]; then
		local core_count=$(grep -Fc processor /proc/cpuinfo)
	else
		local core_count=0
	fi

	if [ $core_count -gt 1 ]; then
		echo -n $[$core_count-1]
	else
		echo -n 1
	fi
}

build() {
  cd "${srcdir}/${_gitname}"

  msg "Running make..."
  make -j$(_optimal_make_jobs)
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="$pkgdir/usr" install
  rm -rf "$srcdir"
}
