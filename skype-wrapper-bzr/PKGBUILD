# Maintainer: shtsh <anton.liparin AT  gmail DOT com>
pkgname=skype-wrapper-bzr
pkgver=20120907
pkgrel=2
pkgdesc="Integrates Skype with Unity"
arch=("i686" "x86_64")
url="https://launchpad.net/~skype-wrapper/+archive/ppa"

license=('GPL2')
#source=("http://www.rainbow-software.org/linux_files/${pkgname}_${pkgver}.tar.gz"
#"95-ipad_charge.rules.patch"
#"ipad_charge.c.patch"
#)
depends=('skype' 'skype4py')
makedepends=('bzr')

#bzr branch lp:~stonerl/skype-wrapper/trunk
_bzrurl="lp:~stonerl/skype-wrapper/trunk"
_bzrname="trunk"

build() {

  cd "${srcdir}"
        # Download or update the library
  msg "Connecting to server..."
  if [[ -d "${_bzrname}" ]]; then
          (cd "${_bzrname}" && bzr update)
          msg "The local repository was updated."
  else
    bzr branch ${_bzrurl}
    msg "The remote repository was cloned."
  fi
  msg "Sync done, or server error (contact the maintainer)."
  cd $srcdir/${_bzrname}

  msg "Patching"
  find . -type f -exec sed -i 's/python$/python2/g' {} \;
  find . -type f -exec sed -i 's/python\ /python2\ /g' {} \;
  find . -type f -exec sed -i "s/python'/python2'/g" {} \;
}

package() {
  cd $srcdir/${_bzrname}
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
