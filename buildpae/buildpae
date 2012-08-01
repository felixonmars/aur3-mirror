#!/bin/bash

#
# :: buildpae ::
#
# Modifies the stock kernel PKGBUILD and its supporting files from ABS.
# Builds 'linux-pae' and 'linux-pae-headers' binary packages.
# Creates source PKG for AUR.
#
# buildpae [ -c | -t ]
#
#	-c	core
#	-t	testing
#
# Tom Wizetek <tom@wizetek.com>
#
# update 15: 2012-07-28 v3.4.6 added package signing
# update 14: 2011-11-10 v3.1 adjustments for updated kernel PKGBUILD (new patches - MD5, LEDS_ALIX2 in config)
# update 13: 2011-08-17 v3.0.2 fixed modifying pkgbase and appending pkgdesc
# update 12: 2011-08-08 v3.0.1 updated for kernel 3.0
# update 11: 2011-05-15 delete groups=('base'); ESC key = quit when prompted
# update 10: 2011-04-12 small bugfix when passing command line arguments
# update 9:  2011-03-26 new resync action, new automated build process via command arguments
# update 8:  2010-12-11
# update 7:  2010-11-28
# update 6:  2010-11-26
# update 5:  2010-09-30
# update 4:  2010-06-03
# update 3:  2010-03-28
# update 2:  2010-03-21
# update 1:  2010-02-10
# original:  2010-01-30
#

# where to build packages:
##########################
_BUILDPATH=~/builds
##########################

# automated build process
case $1 in
  -c) _syncabs=c && _repo=core && _splitpkg=b && _buildnow=y ;;
  -t) _syncabs=t && _repo=testing && _splitpkg=b && _buildnow=y ;;
  '') ;;
  *) echo "Unrecognized option: $1" ;;
esac

kernelver()
{
  _kverinst=$(pacman -Q linux 2>/dev/null | awk '{print $2}')
  _kverpae=$(pacman -Q linux-pae 2>/dev/null | awk '{print $2}')
  _pbcore=/var/abs/core/linux/PKGBUILD
  _pbtesting=/var/abs/testing/linux/PKGBUILD
  _kvercore=$(grep '_basekernel=' ${_pbcore} 2>/dev/null | cut -d'=' -f2)
  _kvercore=${_kvercore}$(grep 'pkgver=' ${_pbcore} 2>/dev/null | cut -d'}' -f2)
  _kvercore=${_kvercore}-$(grep 'pkgrel=' ${_pbcore} 2>/dev/null | cut -d'=' -f2)
  _kvertesting=$(grep '_basekernel=' ${_pbtesting} 2>/dev/null | cut -d'=' -f2)
  _kvertesting=${_kvertesting}$(grep 'pkgver=' ${_pbtesting} 2>/dev/null | cut -d'}' -f2)
  _kvertesting=${_kvertesting}-$(grep 'pkgrel=' ${_pbtesting} 2>/dev/null | cut -d'=' -f2)
  echo -e "\nKernel version info:\n\ninstalled stock ARCH\t${_kverinst}\ninstalled PAE\t\t${_kverpae}\navailable ABS core\t${_kvercore}\navailable ABS testing\t${_kvertesting}\n"
}

kernelver

syncabs()
{
  if ! [[ ${_syncabs} ]]
  then
    echo -en "Sync package 'linux' from ABS repo: [c]ore, [t]esting or [B]oth?  [s]kip, [q]uit =>"
    read -n 1 _syncabs
    [[ ${_syncabs} ]] && echo
  fi
  case ${_syncabs} in
    c|C) abs core/linux || sudo abs core/linux && kernelver ;;
    t|T) abs testing/linux || sudo abs testing/linux && kernelver ;;
    b|B|'') _syncabs=b ; abs core/linux && abs testing/linux || sudo abs core/linux && sudo abs testing/linux && kernelver ;;
    s|S) unset _syncabs ; echo ;;
    q|Q|) echo -e "\nQuit!\n" ; exit 1 ;;
    *) unset _syncabs ; syncabs ;;
  esac
}

syncabs

absrepo()
{
  echo -en "Use ABS repo: [C]ore or [t]esting?  [r]esync, [q]uit =>"
  read -n 1 _absrepo
  [[ ${_absrepo} ]] && echo
  case ${_absrepo} in
    c|C|'') _repo='core' ;;
    t|T) _repo='testing' ;;
    r|R) echo ; syncabs ; absrepo ;;
    q|Q|) echo -e "\nQuit!\n" ; exit 1 ;;
    *) absrepo ;;
  esac
}

[[ ${_repo} ]] || absrepo

_PKGBUILD=/var/abs/${_repo}/linux/PKGBUILD
[[ ! -e ${_PKGBUILD} ]] && echo -e "\nCould not find ${_PKGBUILD}\nSync ABS later again before building package.\n" && exit 1

_basekernel=$(sed -n 's/^_basekernel=//p' ${_PKGBUILD})
pkgver=$(sed -n 's/^pkgver=${_basekernel}//p' ${_PKGBUILD})
pkgrel=$(sed -n 's/^pkgrel=//p' ${_PKGBUILD})
_path=${_BUILDPATH}/linux-pae-${_basekernel}${pkgver}-${pkgrel}
echo -e "\nBuild directory: ${_path}\n"
mkdir -p ${_path}
cd ${_path}
cp /var/abs/${_repo}/linux/* .
cp PKGBUILD PKGBUILD.orig
cp config config.orig
cp linux.preset linux-pae.preset
cp linux.install linux-pae.install

#
# config
#
sed -i 's/CONFIG_HIGHMEM4G=y/# CONFIG_HIGHMEM4G is not set/' config
sed -i 's/# CONFIG_HIGHMEM64G is not set/CONFIG_HIGHMEM64G=y/' config
sed -i '$a\
\
# Tom Wizetek: settings not included in stock config (set to default)\
CONFIG_XEN=n\
CONFIG_I2O_EXT_ADAPTEC_DMA64=y\
CONFIG_LEDS_ALIX2=n' config

#
# PKGBUILD
#
#sed -i '/^pkgbase=/i\# Contributor: Tom Wizetek <tom@wizetek.com>' PKGBUILD
sed -i '/# Maintainer/,/^pkgbase=/ s/^$/# Contributor: Tom Wizetek <tom@wizetek.com>/' PKGBUILD
sed -i '/# Contributor/G' PKGBUILD
sed -i 's/^pkgbase=linux/&-pae/' PKGBUILD

splitpkg()
{
  if ! [[ ${_splitpkg} ]]
  then
    echo -en "Package(s) to build: [k]ernel only or [B]oth kernel and headers?  [q]uit =>"
    read -n 1 _splitpkg
    [[ ${_splitpkg} ]] && echo
  fi
  case ${_splitpkg} in
    k|K) sed -i '/^pkgname=/ s/(.*/linux-pae/' PKGBUILD ;;
    b|B|'') sed -i "/^pkgname=/ s/' .*/-pae' 'linux-pae-headers')/" PKGBUILD ;;
    q|Q|) echo -e "\nQuit!\n" ; exit 1 ;;
    *) splitpkg ;;
  esac
}

splitpkg

sed -i '/^# pkgname=/d' PKGBUILD
sed -i '/^makedepends=/d' PKGBUILD
sed -i "/^arch=/ s/ 'x86_64'//" PKGBUILD
sed -i "s/ 'config.x86_64'$//" PKGBUILD
sed -i 's/package_linux/&-pae/' PKGBUILD
sed -i 's/and modules/& with PAE support (HIGHMEM64G)/' PKGBUILD
sed -i "/groups=('base')/d" PKGBUILD
sed -i '/provides=/ s/kernel26/&-pae/' PKGBUILD
sed -i '/conflicts=/ s/kernel26/&-pae/' PKGBUILD
sed -i '/replaces=/ s/kernel26/&-pae/' PKGBUILD
sed -i 's/modules for linux/&-pae/' PKGBUILD

#[deprecated]
#sed -i '/^package_linux-manpages()/,/^}/d' PKGBUILD
#[deprecated]
#sed -i '/^package_linux-pae-docs()/,/^}/d' PKGBUILD
sed -i '/^package_linux-pae-docs()/,/^}/ s/^/#&/' PKGBUILD

sed -i '$a\
\
# workaround for uploading split packages to AUR\
pkgname=linux-pae\
pkgdesc="The Linux kernel and modules with PAE support (HIGHMEM64G)"\
' PKGBUILD

#[deprecated]
#sed -i '/^# vim:set/ i\
## workaround for uploading split packages to AUR\
#pkgname=linux-pae\
#pkgdesc="The Linux kernel and modules with PAE support (HIGHMEM64G)"\
#' PKGBUILD

#[deprecated]
#sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' PKGBUILD

#
# linux.preset
#
sed -i 's/linux/&-pae/' linux-pae.preset

#
# linux.install
#
sed -i 's/^KERNEL_NAME=/&-pae/' linux-pae.install
sed -i 's/-ARCH/-pae/' linux-pae.install

#
# Generate and replace MD5 checksums.
#
makepkg -g > buildpae.tmp
sed -i '/md5sums=(/,/)/d' PKGBUILD
#sed -i "/md-raid10-fix-bug-when-activating-a-hot-spare.patch')$/r buildpae.tmp" PKGBUILD
sed -i "/.patch')$/r buildpae.tmp" PKGBUILD

#
# Clean up.
#
rm buildpae.tmp
rm config.x86_64

#
# Build src PKG
#
makepkg --source --force

#
# Build bin PKG(s): install missing dependencies, install/upgrade package, sign with PGP key.
#
buildnow()
{
  echo -en "Modifications completed. Build package now? [Y/n|q] =>"
  read -n 1 _buildnow
  [[ ${_buildnow} ]] && echo
  case ${_buildnow} in
    y|Y|'') ;;
    n|N|q|Q|) echo -e "\nTo build package(s) later using current configuration, run $(basename $0) again or manually run makepkg.\n" ; exit 1 ;;
    *) buildnow ;;
  esac
}

[[ ${_buildnow} ]] || buildnow

makepkg --syncdeps --install --sign --log || makepkg --sign -siRfL || (rm -r ${_path}/{src,pkg} && makepkg --sign -siL)

#
# Create repository DB and sign.
#
repo-add --verify --sign linux-pae.db.tar.gz *.pkg.tar.xz

#
# Install bin PKG(s). [deprecated]
#
#pacman -U ${_path}/linux-pae-*${_basekernel}${pkgver}-${pkgrel}-*.pkg.* ||\
#sudo pacman -U ${_path}/linux-pae-*${_basekernel}${pkgver}-${pkgrel}-*.pkg.*

# EoF
