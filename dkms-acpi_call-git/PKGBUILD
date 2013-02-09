# Maintainer: easydor <sl.easy (at) gmx (dot) net>
# Former maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=dkms-acpi_call-git
pkgver=20130209
pkgrel=1
pkgdesc="kernel module that enables you to call ACPI methods by writing the method name followed by arguments to /proc/acpi/call, e.g. to turn off discrete graphics card in a dual graphics environment (like NVIDIA Optimus)"
arch=('i686' 'x86_64')
url=("http://github.com/mkottman/acpi_call")
license=('GPL')
provides=('acpi_call' 'acpi_call-git')
conflicts=('acpi_call' 'acpi_call-git')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: needed if using ARCH provided kernel'
        'linux-lts-headers: needed if using the archlinux lts kernel')
source=('dkms.conf')
install=acpi_call.install
sha512sums=('e9c9f645ea016cb912b2889a4a90be15459b5e28a9706a9a50d23aa64625a98e01c6c58c67eb05269e73c1827856b23c835047bdc29cd5f990c340d5ad764191')

_gitroot=("https://github.com/mkottman/acpi_call.git")
_gitname=("acpi_call")

build() {
  warning "Please make sure kernel headers are built/installed for the kernel acpi_call will be used with ::"
  warning "example #1: 'pacman -S linux-headers'"
  warning "example #2: 'pacman -S linux-lts-headers'"

  cd "${srcdir}"

  ## Git checkout
  if [ -d "${srcdir}/${_gitname}" ] ; then
    msg "Git checkout:  Updating existing tree"
    cd "${_gitname}" && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone "${_gitroot}"
  fi
  msg "Checkout completed"
}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/src/acpi_call-${pkgver}/"
  for i in "${srcdir}/${_gitname}/"{Makefile,acpi_call.c}; do
    install -m644 "${i}" "${pkgdir}/usr/src/acpi_call-${pkgver}/"
  done
  sed "s/REPLACE/${pkgver}/" "${srcdir}/dkms.conf" > "${pkgdir}/usr/src/acpi_call-${pkgver}/dkms.conf"

  install -d ${pkgdir}/usr/share/${_gitname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm755  ${srcdir}/${_gitname}/examples/asus1215n.sh \
    ${pkgdir}/usr/share/${_gitname} || return 1
  install -Dm755 ${srcdir}/${_gitname}/examples/dellL702X.sh \
    ${pkgdir}/usr/share/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}/examples/m11xr2.sh \
    ${pkgdir}/usr/share/${_gitname} || return 1
  install -Dm755  ${srcdir}/${_gitname}/examples/turn_off_gpu.sh \
    ${pkgdir}/usr/share/${_gitname} || return 1
  ln -s /usr/share/${_gitname}/turn_off_gpu.sh \
    ${pkgdir}/usr/bin/turn_off_gpu.sh || return 1
  install -Dm755  ${srcdir}/${_gitname}/support/query_dsdt.pl \
    ${pkgdir}/usr/share/${_gitname} || return 1
  cp -R support/windump_hack \
    ${pkgdir}/usr/share/${_gitname}/
  install -Dm644 README.md \
    ${pkgdir}/usr/share/${_gitname}/README.md
}

