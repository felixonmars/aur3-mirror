pkgname=check_multi-git
pkgver=20111028
pkgrel=1
pkgdesc="nagios plugin simillar to NRPE"
arch=('i686' 'x86_64')
url="http://my-plugin.de/wiki/projects/check_multi/start"
license=('GPL')
_gitroot='git://github.com/flackem/check_multi'
_gitname='check_multi'

build() {
  cd $srcdir

  if [ -e ${_gitname} ] ; then
    cd ${_gitname}
    git pull
    cd ..
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd $srcdir/${_gitname}

  ./configure --prefix=/usr
  make all
}

package() {
  _exe_dest="${pkgdir}/usr/share/nagios/libexec"

  mkdir -p "${_exe_dest}"
  cd "$srcdir/${_gitname}"
  install -m755 plugins/check_multi "${_exe_dest}/"
}

# vim:set ts=2 sw=2 et:
