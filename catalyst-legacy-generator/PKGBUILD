# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Shen Miren <dickeny@gmail.com> (catalyst_build_module idea and important code)
# Great Contributor: B. M. Kwapinski <lord.xml@web.de> (makepkg idea)
# Contributor: aidanlinz
# Contributor: Rip-Rip
# Contributor: nob
# Contributor: Sebastian Siebert


pkgname=catalyst-legacy-generator
pkgver=13.1
pkgrel=2
pkgdesc="AMD/ATI drivers. Generator of catalyst-{kernver} packages with fglrx module inside"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
depends=('catalyst-legacy-utils' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch')
replaces=('catalyst' 'catalyst-hook' 'catalyst-daemon')
conflicts=('catalyst-test' 'nvidia' 'xf86-video-ati' 'xf86-video-radeonhd' 'ati-dri' 'catalyst-hook' 'catalyst' 'catalyst-daemon')
provides=("catalyst=${pkgver}" "catalyst-generator")
install=${pkgname}.install
#8.97.100.7
source=(
    http://www2.ati.com/drivers/legacy/amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.zip
    catalyst_build_module
    catalyst-PKGBUILD
    catalyst.install
    ati_make.sh
    makefile_compat.patch
    3.5-do_mmap.patch
    arch-fglrx-3.7.patch
    arch-fglrx-3.8.patch)
#    ${patch_file})

md5sums=('c07fd1332abe4c742a9a0d0e0d0a90de'
         '8fad04d06f0148d1a12173b3a43972c1'
	 '42407c1fc17ff4fe0bfce619bf2c3e7e'
	 '019efc177ccd85d5c1f9b420f8e58044'
	 '450c38ed78d5845a8d4636cba48f911d'
	 '8b77d3e5fdf571fa67cbe8c22be06373'
	'50045abf43cfbea39b48128b5d8672d8' 
	'e1a2b083fa177eea86723d5382c373b6'
	 'a710196c34aaa9f349e85bff7e0c4e7d')
#         ${patch_md5})


build() {
  ## Unpack archive
    msg "Unpacking archive ..."
	/bin/sh ./amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.run --extract archive_files
}

package() {
    # License
      install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
      install -m644 "${srcdir}/archive_files/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1

      if [ "${CARCH}" = "i686" ]; then
	cd "${srcdir}/archive_files/arch/x86/usr" || return 1
	_lib=lib
      elif [ "${CARCH}" = "x86_64" ]; then
	cd "${srcdir}/archive_files/arch/x86_64/usr" || return 1
	_lib=lib64
      fi

    # Prepare modules source files
      _archdir=x86_64
      test "${CARCH}" = "i686" && _archdir=x86
      cd "${srcdir}/archive_files/"
      install -m755 -d "${pkgdir}/usr/share/ati/build_mod" || return 1
      install -m644 common/lib/modules/fglrx/build_mod/*.c \
                "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 common/lib/modules/fglrx/build_mod/*.h \
                "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 common/lib/modules/fglrx/build_mod/2.6.x/Makefile \
                "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a \
                "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m755 -d "${pkgdir}/usr/bin" || return 1
      install -m755 "${srcdir}/catalyst_build_module" "${pkgdir}/usr/bin" || return 1

      sed -i -e "s/catver=.*/catver=${pkgver}-${pkgrel}/" "${pkgdir}/usr/bin/catalyst_build_module"

    # catalyst pkgbuild
      install -m644 "${srcdir}/catalyst-PKGBUILD" "${pkgdir}/usr/share/ati/build_mod/PKGBUILD" || return 1
      sed -i -e "s/pkgver=.*/pkgver=${pkgver}/" "${pkgdir}/usr/share/ati/build_mod/PKGBUILD" || return 1
      sed -i -e "s/pkgrel=.*/pkgrel=${pkgrel}/" "${pkgdir}/usr/share/ati/build_mod/PKGBUILD" || return 1

    # catalyst.install
      install -m644 "${srcdir}/catalyst.install" "${pkgdir}/usr/share/ati/build_mod/" || return 1

    # modified ati's make.sh script
      install -m755 "${srcdir}/ati_make.sh" "${pkgdir}/usr/share/ati/build_mod/" || return 1

    # makefile patch to choose arch_compat_alloc_user_space or older compat_alloc_user_space
    # works only in combination with ati_make.sh script
      install -m644 "${srcdir}/makefile_compat.patch" "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 "${srcdir}/3.5-do_mmap.patch" "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 "${srcdir}/arch-fglrx-3.7.patch" "${pkgdir}/usr/share/ati/build_mod/" || return 1
      install -m644 "${srcdir}/arch-fglrx-3.8.patch" "${pkgdir}/usr/share/ati/build_mod/" || return 1

    # optional patch
#      for ver in ${patch_ver}; do
#      install -m644 "${srcdir}/${patch_file}" \
#                "${pkgdir}/usr/share/ati/build_mod/${ver}.patch" || return 1
#      done

}
