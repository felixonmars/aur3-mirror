pkgname=kmail-git
pkgver=20110725
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'kdepim4-runtime-git' 'libxss' 'pilot-link' 'kde-agent')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/kdepim/kmail"
_gitname="kmail"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_RPATH=ON \
		-DKDEPIM_BUILD_MOBILE=OFF

  make
}

package_kdepim4-kmail-git() {
        pkgdesc='Mail Client'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kmail')
        url="http://kde.org/applications/internet/kmail/"
        install='kmail-git.install'
        optdepends=('cyrus-sasl-plugins: CRAM-MD5 authentication')
        for i in kmail doc/kmail kmailcvt ksendemail libksieve mailcommon \
                nepomuk_email_feeder ontologies templateparser kontact/plugins/kmail; do
                cd "${srcdir}"/build/${i}
                make DESTDIR="${pkgdir}" install
        done
}

url="http://www.kde.org"
pkgdesc="KDE4 PIM Utilities"
