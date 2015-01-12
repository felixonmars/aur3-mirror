# Contributor: Thomas Bächler <thomas@archlinux.org>
# Maintainer: N30N <archlinux@alunamation.com>
pkgname=ovmf-fishman-git
pkgver=r14835.4eb24af
pkgrel=1
arch=('any')
pkgdesc="Fishman's branch of Tianocore UEFI firmware for qemu (includes SATA controller support)."
url="http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=EDK2"
license=('custom')
makedepends=('git' 'python2' 'iasl' 'nasm')
source=('edk2::git+https://github.com/fishman/edk2.git#branch=apple')
sha256sums=('SKIP')
options=(!makeflags)
_toolchain_opt=GCC49
provides=("ovmf" "ovmf-svn")
conflicts=("ovmf")

pkgver() {
  cd "${srcdir}"/edk2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  # edk2 uses python everywhere, but expects python2
  rm -rf bin
  mkdir bin
  ln -s /usr/bin/python2 bin/python
  # Case fix
  cd edk2
  sed "s/Baselib.h/BaseLib.h/" -i OvmfPkg/Library/AppleSupportLib/AppleSupport.c
}

build() {
  if [ "$CARCH" != "x86_64" ]; then
    error "This package must be built under the x86_64 architecture."
    false
  fi
  export PATH="${srcdir}/bin:$PATH"
  cd "${srcdir}/"edk2
  make -C BaseTools
  export EDK_TOOLS_PATH="${srcdir}"/edk2/BaseTools
  . edksetup.sh BaseTools

  # Set RELEASE target, toolchain and number of build threads
  sed "s|^TARGET[ ]*=.*|TARGET = RELEASE|; \
       s|TOOL_CHAIN_TAG[ ]*=.*|TOOL_CHAIN_TAG = ${_toolchain_opt}|; \
       s|MAX_CONCURRENT_THREAD_NUMBER[ ]*=.*|MAX_CONCURRENT_THREAD_NUMBER = $(nproc)|;" -i Conf/target.txt
  # Build OVMF for ia32
  sed "s|^TARGET_ARCH[ ]*=.*|TARGET_ARCH = IA32|; \
       s|^ACTIVE_PLATFORM[ ]*=.*|ACTIVE_PLATFORM = OvmfPkg/OvmfPkgIa32.dsc|;" -i Conf/target.txt
  ./BaseTools/BinWrappers/PosixLike/build
  # Build OVMF for x64
  sed "s|^TARGET_ARCH[ ]*=.*|TARGET_ARCH = X64|; \
       s|^ACTIVE_PLATFORM[ ]*=.*|ACTIVE_PLATFORM = OvmfPkg/OvmfPkgX64.dsc|;" -i Conf/target.txt
  ./BaseTools/BinWrappers/PosixLike/build
}

package() {
  cd "${srcdir}/edk2/Build/OvmfIa32/RELEASE_${_toolchain_opt}/FV/"
  install -Dm644 OVMF.fd "${pkgdir}/usr/share/ovmf/ovmf_ia32.bin"
  install -m0644 OVMF_CODE.fd "${pkgdir}/usr/share/ovmf/ovmf_code_ia32.bin"
  install -m0644 OVMF_VARS.fd "${pkgdir}/usr/share/ovmf/ovmf_vars_ia32.bin"
  cd "${srcdir}/edk2/Build/OvmfX64/RELEASE_${_toolchain_opt}/FV"
  install -Dm644 OVMF.fd "${pkgdir}/usr/share/ovmf/ovmf_x64.bin"
  install -m0644 OVMF_CODE.fd "${pkgdir}/usr/share/ovmf/ovmf_code_x64.bin"
  install -m0644 OVMF_VARS.fd "${pkgdir}/usr/share/ovmf/ovmf_vars_x64.bin"
  install -D -m644 "${srcdir}/edk2/OvmfPkg/License.txt" "${pkgdir}"/usr/share/licenses/ovmf/License.txt
}
