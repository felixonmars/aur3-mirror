# Maintainer: Brent Saner <bts (at) phreewifi (dot) org>
# Special thanks to ejabberd-mod_admin_extra-svn maintainer
# Damian Nowak <damian.nowak@pacmanvps.com> and contributor
# Thomas Mudrunka <harvie@@email..cz> for giving me a model
# to base this on.

pkgname=ejabberd-mod_all-svn
pkgver=1138
pkgrel=2
pkgdesc="A package for ALL ejabberd modules"
arch=('any')
url="https://www.ejabberd.im/ejabberd-modules"
license=('GPL')
depends=('ejabberd')
makedepends=('erlang-nox' 'subversion')
conflicts=('ejabberd-mod_admin_extra-svn' 'ejabberd-mod_archive' 'ejabberd-mod_muc_admin')
source=('svn+https://svn.process-one.net/ejabberd-modules')
md5sums=('SKIP')

# and to save some typing, because I am lazy.
_swname="ejabberd-modules"

## HAH. autoincrement.
pkgver() {
  cd "${_swname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}


package() {
  cd ${_swname}
  ROOTDIR=$(pwd)

  mkdir ${ROOTDIR}/docs
  
  for module in $(ls -1d mod_*);
  do
    cd ${module}/trunk

    # We should probably grab the READMEs.
    for README in $(ls -1 README*);
    do
      cp "${README}" "${ROOTDIR}/docs/${module}.${README}"
    done

    # Hey, thanks, ProcessOne!
    ./build.sh

    rm -rf ebin/.svn

    cd ${ROOTDIR}
  done

  # These are provided as part of the vanilla package, apparently.
  for EXISTING in iconv mod_http_fileserver mod_irc mod_irc_connection mod_register_web;
  do
    find ./ -type f -iname "${EXISTING}.beam" -delete
  done

  install -d -m 0755 "${pkgdir}"/usr/lib/ejabberd/ebin
  install -d -m 0755 "${pkgdir}"/usr/share/doc/ejabberd-mod_all

  find ./mod_*/trunk/ebin/ -type f -iname "*.beam" -exec cp '{}' "${pkgdir}"/usr/lib/ejabberd/ebin/. \;
  cp -r ${ROOTDIR}/docs/* ${pkgdir}/usr/share/doc/ejabberd-mod_all/.
}
