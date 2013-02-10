# Contributor: Rick W. Chen <stuffcorpse at archlinux dot us>

pkgname=bfin-toolchain-git
pkgver=20130210
pkgrel=1
pkgdesc="GNU toolchain for the Blackfin processor"
arch=('i686' 'x86_64')
url="http://blackfin.uclinux.org/"
license=('GPL2')
depends=('zlib' 'libx11' 'libftdi' 'xorg-server-xvfb')
options=(!strip !makeflags zipman docs)
makedepends=('git' 'bison' 'autoconf' 'automake' 'awk' 'libftdi'
             'expect' 'dejagnu' 'xz')
source=("${pkgname}.sh" "qemu_configure_python2.patch")
sha1sums=('937cba00f80d9001dd293743ad7009a78b71b904'
          '3d8f019b124eed3b4cbb4f4e461a8070d75bfa0a')
backup=("etc/profile.d/${pkgname}.sh")

#########
# options
#########
_branch="trunk"      # git branch: e.g. trunk, 2012R2, etc.
_binutils_ver="2.21" # binutils version: 2.21, 2.17
_gcc_version="4.3"   # target gcc version: 4.3 or 4.5
_date_stamp=1        # date Stamp all output files
_disable_gfx=0       # disable all graphical utilities
_keep_builddir=1     # keep build directory afterwards
_keep_logs=1         # keep build logs at the end of makepkg
_stack_check=0       # add stack checking to all tests
_test_hardware=0     # test components on hardware (arg: ip address or 0)
_test_simulator=0    # test components on simulator
_verbose=0           # verbose
_warnings_log=1      # warnings to be sent to a different log file

###########
# git repos
###########
_gitname=("toolchain" "linux-kernel" "u-boot")
_gitmirror="git://sources.blackfin.uclinux.org/git"
_gitroot=("$_gitmirror/readonly-mirrors/${_gitname[0]}"
          "$_gitmirror/${_gitname[1]}"
          "$_gitmirror/${_gitname[2]}")

######
# dirs
######
_logdir="${startdir}/logs"
_testdir="${startdir}/tests"
_builddir="${srcdir}/build"

#######
# do it
#######
build() {
  cd "${srcdir}"

  ########################
  # checking out git repos
  ########################
  msg "Checking out git repos"

  local repo br len=0
  for repo in ${_gitname[@]}; do
    if [[ -d "${srcdir}/$repo" ]] ; then
      msg2 "Updating $repo git mirror"
      cd "${srcdir}/$repo"
      br=$_branch
      git --bare fetch origin $br:$br
      cd "${srcdir}"
    else
      msg2 "Creating $repo git mirror"
      git clone --mirror ${_gitroot[$len]} ${_gitname[$len]}
    fi
    len=$(( $len+1 ))
  done
  unset repo br len

  #################
  # build directory
  #################
  msg "Creating build directory"

  [[ -d "${_builddir}" ]] && rm -fr "${_builddir}"
  mkdir -p "${_builddir}"

  local repo br
  for repo in ${_gitname[@]}; do
    cd "${_builddir}"
    msg2 "Cloning local $repo source tree"
    git clone -l "${srcdir}/$repo" "${_builddir}/$repo"

    if [[ ! "$_branch" == "trunk" ]] ; then
      msg2 "Checking out branch: $_branch"
      cd "${_builddir}/$repo" && git checkout $_branch
    fi
  done
  unset repo br

  ###############
  # parse options
  ###############
  declare _optargs

  [[ $_date_stamp     -eq 1 ]] && _optargs="$_optargs -d"
  [[ $_disable_gfx    -eq 1 ]] && _optargs="$_optargs -X"
  [[ $_stack_check    -eq 1 ]] && _optargs="$_optargs -f"
  [[ $_test_hardware  -ne 0 ]] && _optargs="$_optargs -T $_test_hardware"
  [[ $_test_simulator -eq 1 ]] && _optargs="$_optargs -t"
  [[ $_verbose        -eq 1 ]] && _optargs="$_optargs -v"
  [[ $_warnings_log   -eq 1 ]] && _optargs="$_optargs -w"

  if [[ -n $_optargs ]] ; then
    msg "Extra build options: $_optargs"
  fi

  ####################
  # run BuildToolChain
  ####################
  msg "Starting make..."

  msg2 "Unsetting CFLAGS LDFLAGS"
  unset CFLAGS CXXFLAGS LDFLAGS

  mkdir -p "$_logdir"

  (cd "${_builddir}/$_gitname" \
    && git apply "${srcdir}/qemu_configure_python2.patch")

  "${_builddir}/$_gitname/buildscript/BuildToolChain" \
          -m "/usr/bin/make" \
          -c "${_gcc_version}" \
          -b "${_builddir}" \
          -B "${_binutils_ver}" \
          -O "${_builddir}/package" \
          -s "${_builddir}/${_gitname[0]}" \
          -k "${_builddir}/${_gitname[1]}" \
          -u "${_builddir}/${_gitname[2]}" \
          $_optargs | tee "$_logdir/script.log"
}

package() {
  _dest="$pkgdir/opt/blackfin"

  install -Dm755 "$srcdir/${pkgname}.sh" "$pkgdir/etc/profile.d/${pkgname}.sh"
  install -Dm755 -d "$_dest"
  cp -arf "$_builddir/package/share/man/man1"/* "$_builddir/package/man/man1"/
  cp -arf "$_builddir/package"/* "$_dest"/

  ###########
  # stripping
  ###########
  if [[ -n $_dest ]] ; then
    msg "Stripping debugging symbols from binaries"
    local binary
    find $_dest -type f 2>/dev/null | while read binary ; do
      case "$(file -biz "$binary")" in
        *compressed-encoding*)      # Skip compressed binarys
          ;;
        *application/x-executable*) # Binaries
          /usr/bin/strip "$binary" >/dev/null 2>&1 || continue ;;
      esac
    done
  fi

  #########
  # cleanup
  #########
  msg "Cleaning up"

  if [[ "$_keep_logs" -eq 1 ]] ; then
    msg2 "Backing up build logs"
    _logs="$_logdir/logs-$(date +%Y%m%d%H%M)"
    mkdir -p $_logs
    cp -arf "${_logdir}"/*.log $_logs/
    cp -arf "${_builddir}/logs"/* $_logs/
    xz -9 $_logs/*
  else
    [[ $(ls -A "$_logdir") ]] || rm -fr "$_logdir"
  fi

  if [[ "$_test_simulator" -eq 1 ]] || [[ "$_test_hardware" -eq 1 ]] ; then
    msg2 "Backing up test results"
    mkdir -p "$startdir"/tests
    cp -arf "${_builddir}/tests"/* "$_testdir"/
  fi

  if [[ "$_keep_builddir" -eq 0 ]] ; then
    msg2 "Removing build directory"
    rm -fr "${_builddir}"
  fi
}

# vim: ts=2:sw=2:sts=2:et:
