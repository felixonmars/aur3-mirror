# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=acpi_call-git
pkgver=1.1.0
pkgrel=3
pkgdesc="kernel module that enables calls to ACPI methods through /proc/acpi/call. e.g. to turn off discrete graphics card in a dual graphics environment (like NVIDIA Optimus)"
arch=('i686' 'x86_64')
url=("http://github.com/mkottman/acpi_call")
license=('GPL')
makedepends=('git')
optdepends=('linux-headers: needed if using archlinux default kernel'
	    'linux-lts-headers: needed if using the archlinux lts kernel')
provides=('acpi_call')
install=acpi_call.install
_gitname=("acpi_call")
source=("$_gitname"::'git://github.com/mkottman/acpi_call.git')
md5sums=('SKIP')


pkgver() {
  cd ${_gitname}
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  warning "Please make sure linux kernel headers are built/installed for the kernel acpi_call will be used with ::"
  warning "example #1: 'pacman -S linux-headers'"
  warning "example #2: 'pacman -S linux-lts-headers'"

  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"

  install -d "${pkgdir}"/usr/share/"${_gitname}"
  install -d "${pkgdir}"/usr/bin

  install -Dm755  "${srcdir}"/"${_gitname}"/examples/asus1215n.sh \
    "${pkgdir}"/usr/share/"${_gitname}"
  install -Dm755 "${srcdir}"/"${_gitname}"/examples/dellL702X.sh \
    "${pkgdir}"/usr/share/"${_gitname}"
  install -Dm755  "${srcdir}"/"${_gitname}"/examples/m11xr2.sh \
    "${pkgdir}"/usr/share/"${_gitname}"
  install -Dm755  "${srcdir}"/"${_gitname}"/examples/turn_off_gpu.sh \
    "${pkgdir}"/usr/share/"${_gitname}"
  ln -s /usr/share/"${_gitname}"/turn_off_gpu.sh \
    "${pkgdir}"/usr/bin/turn_off_gpu.sh
  install -Dm755  "${srcdir}"/"${_gitname}"/support/query_dsdt.pl \
    "${pkgdir}"/usr/share/"${_gitname}"
  cp -R support/windump_hack \
    "${pkgdir}"/usr/share/"${_gitname}"/
  install -Dm644 README.md \
    "${pkgdir}"/usr/share/"${_gitname}"/README.md

  warning "The following kernel module build procedure *will fail* if your kernel headers are not built/installed!"

  ## the following code was reused from the 'bbswitch-git' PKGBUILD
  _PACKAGES=`pacman -Qsq linux`
  _KERNELS=`pacman -Ql \"${_PACKAGES}\" | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`

   # Find all extramodules directories
  _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

  # Loop through all detected kernels
  for _kernver in "${_KERNELS}"; do
    msg2 'Building module for '"${_kernver}"' ...'
    make KDIR=/usr/src/linux-${_kernver}

    # Loop through all detected extramodules directories
    for _moduledirs in "${_EXTRAMODULES}"; do
      # Check which extramodules directory corresponds with the built module
      if [ `cat /usr/lib/modules/${_moduledirs}/version` = $_kernver ]; then
        mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        install -m644 acpi_call.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/acpi_call.ko"
      fi
    done
  done
}
