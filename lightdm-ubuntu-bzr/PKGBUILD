# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
#Most of this was taken from Morfeo's lightdm PKDBUILD, but modified to use Ubuntu's patches

pkgname=lightdm-ubuntu-bzr
_ubuntu_rel=0ubuntu6
_ubuntu_ver=1.0.1
pkgver=1298
pkgrel=1
pkgdesc="A lightweight display manager"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm"
license=('GPL3' 'LGPL3')
depends=('gnome-themes-standard' 'gnome-backgrounds' 'gnome-icon-theme' 'libwebkit' 'dbus-glib' 'gtk3' 'libxklavier' 'intltool' 'accountsservice')
options=(!libtool !emptydirs)
optdepends=('xorg-server-xephyr: run lightdm in test mode' 
	    'lightdm-webkit-greeter-bzr'
            'unity-greeter: default Ubuntu 11.10 greeter')
makedepends=('gnome-doc-utils' 'gobject-introspection' 'pkg-config' 'bzr' 'gtk-doc')
provides=("lightdm=${pkgver}")
conflicts=('lightdm')
backup=('etc/apparmor.d/lightdm-guest-session'
        'etc/dbus-1/system.d/org.freedesktop.DisplayManager.conf'
        'etc/lightdm.conf'
        'etc/lightdm/keys.conf'
        'etc/lightdm/lightdm.conf'
        'etc/lightdm/lightdm-gtk-greeter.conf'
        'etc/lightdm/lightdm-gtk-greeter-ubuntu.conf'
        'etc/lightdm/users.conf')
source=("http://archive.ubuntu.com/ubuntu/pool/main/l/${pkgname%-*-*}/${pkgname%-*-*}_${_ubuntu_ver}-${_ubuntu_rel}.diff.gz"
        'lightdm'
        'lightdm.service'
        'lightdm-gtk-greeter.conf'
        'lightdm.pam')
install=lightdm.install
sha512sums=('03b7c111db5335e6d22ab6cb7f060395f0f6ce48833e0b028a81b474c412b6bda951b9bdf24dba22fcbbb6177b415c48d164939384212a05b14623a816f0b13c'
            'c4813ae27d81ece8bf66e89c1adbb215443076cb6a2b1da28a5ea9528b25052715331a1d76711a2d06cbf9d41f46afa9a868b404112035db2295c177e7f99cc0'
            '0698d702540b5ea0f8935e8b26c3511f40c681dbf885241b63d4e73e94aff98bb37c8efe4c96f0d8caaefa7be774db49936921f46df3543191515f609154147f'
            'fa35ece114255abfc409f1c9da1eb7129055d8669aad11fe3d69084bf2216e93bf09864ac4e8874e88f166be9735fc55ed899056eb3bd94c5b33d3b2cbd55f4d'
            'ed928f9e7609e98b42783810274586b3a0da224ee6053de38273b6e54a13a2a5ce8c7095e281df38d99c3e2fc6530af988628f5a66166d18e46a24e694b500a4')

_bzrtrunk="lp:lightdm"
_bzrmod="lightdm-trunk"

build() {
  cd "${srcdir}"
  msg "Connecting to Bazaar server...."

  if [[ -d "${_bzrmod}" ]]; then
    pushd "${_bzrmod}" && bzr pull "${_bzrtrunk}" -r "${pkgver}" && popd
  else
    bzr branch "${_bzrtrunk}" "${_bzrmod}" -q -r "${pkgver}"
  fi

  if [ -d "${_bzrmod}-build" ]; then
    rm -rvf "${_bzrmod}-build"
  fi

  cp -rv "${_bzrmod}" "${_bzrmod}-build"

  cd "${_bzrmod}-build"

  #Apply Ubuntu patches
  patch -Np1 -i "${srcdir}/lightdm_${_ubuntu_ver}-${_ubuntu_rel}.diff"

  #These patches do not apply
    #Accepted upstream
      sed -i '/00bzr_guest_session_wrapper.diff/d' 'debian/patches/series'
      sed -i '/04_dmrc_set_LANG_only.patch/d' 'debian/patches/series'
      sed -i '/05_gdmflexiserver_not_in_PATH.patch/d' 'debian/patches/series'
      sed -i '/06_accounts_service_timeout.patch/d' 'debian/patches/series'
      sed -i '/07_long_password_crash.patch/d' 'debian/patches/series'
      sed -i '/08_correct_ck_ref.patch/d' 'debian/patches/series'

  for i in $(cat 'debian/patches/series' | grep -v '#'); do
    patch -Np1 -i "debian/patches/${i}"
  done

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --libexecdir=/usr/lib/lightdm \
    --localstatedir=/var \
    --with-user-session=ubuntu \
    --with-greeter-user=lightdm #\
    #--with-greeter-session=lightdm-gtk-greeter

  make
}

package() {
  cd "${srcdir}/${_bzrmod}-build"
  make DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/etc/rc.d/"
  install -dm755 "${pkgdir}/lib/systemd/system/"

  #Install PAM service
  install -dm755  "${pkgdir}/etc/pam.d/"
  install -m644 "${srcdir}/lightdm.pam" "${pkgdir}/etc/pam.d/lightdm"

  #Install configuration files
  install -d -m755 "${pkgdir}/usr/share/doc/lightdm/"
  install -d -m755 "${pkgdir}/etc/lightdm/"
  install -m644 "${pkgdir}/etc/lightdm/lightdm.conf" "${pkgdir}/usr/share/doc/lightdm/"
  install -m644 "${pkgdir}/etc/lightdm/keys.conf" "${pkgdir}/usr/share/doc/lightdm/"
  install -m644 "debian/lightdm-gtk-greeter-ubuntu.conf" "${pkgdir}/etc/lightdm/"
  install -m644 "${srcdir}/lightdm-gtk-greeter.conf" "${pkgdir}/etc/lightdm/"

  #Install binaries and scripts
  install -d -m755 "${pkgdir}/usr/sbin/"
  install -d -m755 "${pkgdir}/usr/lib/lightdm/"
  install -m755 "debian/lightdm-session" "${pkgdir}/usr/sbin/"
  install -m755 "debian/guest-account" "${pkgdir}/usr/sbin/"
  install -m755 "debian/lightdm-greeter-session" "${pkgdir}/usr/lib/lightdm/"
  chmod +x "${pkgdir}/usr/lib/lightdm/lightdm-greeter-session"

  #Install init script and SystemD service
  install -m755 ../lightdm $pkgdir/etc/rc.d
  install -m644 ../lightdm.service $pkgdir/lib/systemd/system/

  #Configuration settings that differ from Ubuntu
  sed -i -e 's/^\(minimum-uid=\).*$/\11000/g' "${pkgdir}/etc/lightdm/users.conf"
  sed -i -e 's@/usr\(/sbin/nologin\)$@\1@g' "${pkgdir}/etc/lightdm/users.conf"

  #Configuration files specific to Ubuntu
  rm -rvf "${pkgdir}/etc/init/"
}

