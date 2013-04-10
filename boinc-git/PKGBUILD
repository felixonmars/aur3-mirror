# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

## If you want to use X less version, uncomment below.
#_X="no"

## You can change branch to be built.
_branch=master

_apply_patch="yes"

_pkgname=boinc
_gitname=${_pkgname}-v2

pkgname=${_pkgname}-git
pkgver=20130410 
pkgrel=1
arch=('i686' 'x86_64')
url="http://boinc.berkeley.edu/"
license=('LGPL')
pkgdesc="Berkeley Open Infrastructure for Network Computing"
depends=('curl' 'sqlite3')
makedepends=('pkg-config' 'libxslt' 'perl-xml-sax' 'subversion')
provides=('boinc')
replaces=('boinc-svn')
conflicts=('boinc' 'boinc-nox')
options=('!libtool')
install=${_pkgname}.install
changelog=ChangeLog
source=("git://boinc.berkeley.edu/${_gitname}.git#branch=${_branch}"
        boinc.bash
        boinc.desktop
        boinc.service
)
md5sums=('SKIP'
         '05ed267db973ef7cbaf1118bb20bf9ce'
         'db62de2f08117e6379a3c613b58fa7ff'
         'fe02cfd5bddf64307fc4111f0689e1b0')

if [[ "$_X" != "no" ]]; then
  depends+=('wxgtk>=2.8.11.0' 'libnotify')
fi

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/${_gitname}"

  if [[ "$_apply_patch" == "yes" ]]; then
    if [[ "$_branch" == "client_release_7.0.28" ]]; then
      # build fails if automake >=1.12
      sed -i -e 's:AC_PROG_CC:&\nAC_PROG_OBJCXX:' configure.ac
    fi
  fi

  if [[ "$_X" == "no" ]]; then
    _copt="--disable-manager --without-wxdir"
  else
    _copt="--with-x --with-wxdir=/usr/lib --with-wx-config=`which wx-config`"
  fi

  #configure
  LC_ALL=C ./_autosetup # Possibility to fail ver. check depending on the localization.
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-server \
              --enable-unicode \
              --with-ssl \
              --disable-xss \
              --enable-dynamic-client-linkage \
              --disable-static \
              $_copt
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR=$pkgdir install

  #install unit file for systemd
  install -D -m644 "${srcdir}/boinc.service" ${pkgdir}/usr/lib/systemd/system/boinc.service

  #install bash-completion
  install -D -m644 "${srcdir}/boinc.bash" ${pkgdir}/usr/share/bash_completion.d/boinc

  if [[ "$_X" != "no" ]]; then
    #install .desktop File
    install -D -m644 "${srcdir}/boinc.desktop" \
      ${pkgdir}/usr/share/applications/boinc.desktop

    #install icons
    install -D -m644 "${srcdir}/${_gitname}/clientgui/res/boincmgr.48x48.png" \
      ${pkgdir}/usr/share/pixmaps/boinc.png
  fi

  #killing /etc/init.d directory
  rm -rf ${pkgdir}/etc/init.d
}
