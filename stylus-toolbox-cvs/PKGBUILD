# Maintainer: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>

pkgname=stylus-toolbox-cvs
pkgver=20110520
pkgrel=1
pkgdesc="GUI for libgutenprint to manage Epson printer"
arch=('i686' 'x86_64')
url="http://stylus-toolbox.sourceforge.net/"
license=('GPL2')
depends=('cups>=1.2.8' 'dbus>=1.0.2' 'dbus-python' 'gtk2>=2.10' 'gutenprint>=5.0.0.99' 'hal>=0.5.8' 'pycrypto' 'pygtk>=2.10' 'python>=2.4' 'python-pexpect>=2.1' )
makedepends=('cvs' 'pkgconfig>=0.9' 'sed')
provides=()
source=()
md5sums=()

_cvsroot="anonymous@stylus-toolbox.cvs.sourceforge.net:/cvsroot/stylus-toolbox"
_cvsmod="Stylus Toolbox"
_sharename="share/stylus-toolbox"

build() {
  cd "${srcdir}"

	if [ -d "${_cvsmod}/CVS" ]
	then
		msg "Starting CVS update ..."
		cd "${_cvsmod}"
		cvs -z3 update -d
		msg "... updating finished."
	else
		msg "Starting CVS checkout ..."
	  cvs -z3 -f -d:pserver:${_cvsroot} co "${_cvsmod}"
		msg "... checkout finished."
    cd "${_cvsmod}"
	fi

	if [ -e "${srcdir}/${_cvsmod}-build" ]
	then
		rm -rf "${srcdir}/${_cvsmod}-build"
	fi

  msg "CVS checkout done or server timeout"

}

package() {
  msg "Creating directories ..."
  cd "${pkgdir}"
  install -d ./usr/{bin,lib/python2.7/site-packages,${_sharename}} || return 1

  cd ./usr
  [ -d ./bin ] && [ -d ./lib/python2.7/site-packages ] && [ -d ./"${_sharename}" ] && msg "All needed directories created correctly." || return 1

  # Setup
  cd "${srcdir}"/"${_cvsmod}"
  msg "Copying and modifying files ..."

  cp -r ./${_sharename}/icons/ "${pkgdir}"/usr/${_sharename}/ || return 1
  install -m 0755 ./${_sharename}/stylus-toolbox.glade "${pkgdir}"/usr/${_sharename}/ || return 1
  install -m 0644 ./src/{conf.py,dialogs.py,backend.py,stylus_toolbox.py} "${pkgdir}"/usr/${_sharename}/ || return 1
  install -m 0644 ./{GladeGen/GladeWindow.py,pkipplib/pkipplib.py} "${pkgdir}/usr/lib/python2.7/site-packages/" || return 1
  install -m 0755 ./bin/stylus-toolbox.sh "${pkgdir}"/usr/bin/ || return 1

  # Modifying files for usage in non-fake-root
  cd "${pkgdir}"/usr/
  sed -e "s#export STYLUS_TOOLBOX_PATH=%%%PREFIX%%%/${_sharename}#export STYLUS_TOOLBOX_PATH=/usr/${_sharename}#;s#python#python2#" ./bin/stylus-toolbox.sh > ./bin/stylus-toolbox
  rm ./bin/stylus-toolbox.sh
  chmod a+x ./bin/stylus-toolbox

  sed -e "s/from pkipplib import pkipplib/import pkipplib/" ${_sharename}/backend.py > ${_sharename}/backend.py_sed || return 1
  mv ${_sharename}/backend.py_sed ${_sharename}/backend.py || return 1

  [ -e ./bin/stylus-toolbox ] && [ -e ./"${_sharename}"/stylus-toolbox.glade ] && [ -d ./${_sharename}/icons ] && [ -e ./${_sharename}/conf.py ] && [ -e ./${_sharename}/dialogs.py ] && \
  [ -e ./${_sharename}/backend.py ] && [ -e ./${_sharename}/stylus_toolbox.py ] && [ -e ./lib/python2.7/site-packages/GladeWindow.py ] && [ -e ./lib/python2.7/site-packages/pkipplib.py ] && \
  msg "All files were copied and modified correctly." || return 1
}
