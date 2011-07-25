pkgname=kdepim4-git
true && pkgname=('kdepim4-akonadiconsole-git' 'kdepim4-akregator-git' 'kdepim4-blogilo-git' 'kdepim4-console-git'
		 'kdepim4-kaddressbook-git' 'kdepim4-kalarm-git' 'kdepim4-kjots-git' 'kdepim4-kleopatra-git'
		 'kdepim4-kmail-git' 'kdepim4-knode-git' 'kdepim4-knotes-git' 'kdepim4-kontact-git'
		 'kdepim4-korganizer-git' 'kdepim4-kresources-git' 'kdepim4-ktimetracker-git' 'kdepim4-libkdepim-git'
		 'kdepim4-wizards-git')
pkgver=20110725
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'kdepim4-runtime-git' 'libxss' 'pilot-link' 'kde-agent')
groups=('kde4-git' 'kdepim4-git')

_gitroot="git://anongit.kde.org/kdepim"
_gitname="kdepim"

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

package_kdepim4-akonadiconsole-git() {
        pkgdesc='Akonadi Management and Debugging Console'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-akonadiconsole')
        url='http://pim.kde.org'
        install='kdepim4-git.install'
        cd "${srcdir}"/build/akonadiconsole
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-akregator-git() {
        pkgdesc='A Feed Reader for KDE'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-akregator')
        url="http://kde.org/applications/internet/akregator/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/akregator
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/akregator
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/akregator
        make DESTDIR="${pkgdir}" install
}
 
package_kdepim4-blogilo-git() {
        pkgdesc='A KDE Blogging Client'
        depends=('kdepim4-runtime-git')
        url="http://kde.org/applications/internet/blogilo/"
        conflicts=('kdepim-blogilo')
        install='kdepim4-git.install'
        cd "${srcdir}"/build/blogilo
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/blogilo
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-console-git() {
        pkgdesc='Command line tool for accessing calendar files'
        depends=('kdepim4-runtime-git')
	conflicts=('kdepim-console')
        url='http://pim.kde.org'
        install='kdepim4-git.install'
        cd "${srcdir}"/build/console
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kaddressbook-git() {
        pkgdesc='Contact Manager'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kaddressbook')
        url="http://kde.org/applications/office/kaddressbook/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/kaddressbook
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/kaddressbook
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/plugins/kaddressbook
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kalarm-git() {
        pkgdesc='Personal Alarm Scheduler'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kalarm')
        url="http://kde.org/applications/utilities/kalarm/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/kalarm
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/kalarm
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kjots-git() {
        pkgdesc='Note Taker'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kjots')
        url="http://kde.org/applications/utilities/kjots/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/kjots
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/kjots
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/kjots
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kleopatra-git() {
        pkgdesc='Certificate Manager and Unified Crypto GUI'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kleopatra')
        url="http://kde.org/applications/utilities/kleopatra/"
        cd "${srcdir}"/build/kleopatra
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/kleopatra
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kmail-git() {
        pkgdesc='Mail Client'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kmail')
        url="http://kde.org/applications/internet/kmail/"
        install='kdepim4-git.install'
        optdepends=('cyrus-sasl-plugins: CRAM-MD5 authentication')
        for i in kmail doc/kmail kmailcvt ksendemail libksieve mailcommon \
                nepomuk_email_feeder ontologies templateparser kontact/plugins/kmail; do
                cd "${srcdir}"/build/${i}
                make DESTDIR="${pkgdir}" install
        done
}

package_kdepim4-knode-git() {
        pkgdesc='News Reader'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-knode')
        url="http://kde.org/applications/internet/knode/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/knode
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/knode
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/knode
        make DESTDIR="${pkgdir}" install
}
 
package_kdepim4-knotes-git() {
        pkgdesc='Popup Notes'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-knotes')
        url="http://kde.org/applications/utilities/knotes/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/knotes
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/knotes
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/knotes
        make DESTDIR="${pkgdir}" install
}
package_kdepim4-kontact-git() {
        pkgdesc='Personal Information Manager'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kontact')
        url="http://kde.org/applications/office/kontact/"
        install='kdepim4-git.install'
        for i in kontact/src doc/kontact \
                kontact/plugins/summary kontact/plugins/specialdates; do
                cd "${srcdir}"/build/${i}
                make DESTDIR="${pkgdir}" install
        done
}
 
package_kdepim4-korganizer-git() {
        pkgdesc='Calendar and Scheduling Program'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-korganizer')
        url="http://kde.org/applications/office/korganizer"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/korganizer
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/korganizer
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/korganizer
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-kresources-git() {
        pkgdesc='KDE PIM resources'
        depends=('kdepim4-libkdepim-git')
	conflicts=('kdepim-kresources')
        url='http://pim.kde.org'
        cd "${srcdir}"/build/kresources
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-ktimetracker-git() {
        pkgdesc='Personal Time Tracker'
        depends=('kdepim4-kresources-git')
	conflicts=('kdepim-ktimetracker')
        url="http://kde.org/applications/utilities/ktimetracker/"
        install='kdepim4-git.install'
        cd "${srcdir}"/build/ktimetracker
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/doc/ktimetracker
        make DESTDIR="${pkgdir}" install
        cd "${srcdir}"/build/kontact/plugins/ktimetracker
        make DESTDIR="${pkgdir}" install
}

package_kdepim4-libkdepim-git() {
        pkgdesc='Library for KDE PIM'
        depends=('kde-agent' 'kdepim4-runtime-git')
	conflicts=('kdepim-libkdepim')
	url='http://pim.kde.org'
        for i in akonadi_next calendarsupport calendarviews incidenceeditor-ng \
                kdgantt2 libkdepim libkdepimdbusinterfaces libkleo libkpgp \
                messagecomposer messagecore messagelist messageviewer icons \
                strigi-analyzer plugins/messageviewer plugins/ktexteditor; do
                cd "${srcdir}"/build/${i}
                make DESTDIR="${pkgdir}" install
        done
}

package_kdepim4-wizards-git() {
        pkgdesc='KDE Groupware Wizard'
        depends=('kdepim4-kresources-git')
	conflicts=('kdepim-wizards')
        url='http://pim.kde.org'
        cd "${srcdir}"/build/wizards
        make DESTDIR="${pkgdir}" install
}

url="http://www.kde.org"
pkgdesc="KDE4 PIM Utilities"