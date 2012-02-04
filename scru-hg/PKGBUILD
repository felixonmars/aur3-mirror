# Maintainer: Roberto Gea (Alquimista) <alquimistaotaku@gmail.com>

_realname=scru
pkgname=${_realname}-hg
pkgver=12
pkgrel=1
pkgdesc="Screenshot Uploader"
arch=(any)
url="https://bitbucket.org/alquimista"
license=("MIT")
depends=("python-notify" "scrot" "optipng" "xclip" "plac")
makedepends=("mercurial")
options=(!emptydirs)
provides=(${_realname})
conflicts=(${_realname})

_hgroot=${url}
_hgrepo="${_realname}"

echo ${_hgroot} ${_hgrepo}

build() {
    cd "${srcdir}"
    msg "Connecting to Mercurial server...."
    if [ -d "${_hgrepo}/.hg" ] ; then
        cd ${_hgrepo} && hg pull -u
        msg "The local files are updated."
    else
        hg clone ${_hgroot}/${_hgrepo}
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting make..."

    rm -rf "${srcdir}/${_hgrepo}-build"
    cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
    cd "${srcdir}/${_hgrepo}-build"

    python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}-build"

  python2 setup.py install --root="${pkgdir}" --optimize=1

  find "${pkgdir}/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/bin/scru"
  chmod 755 "${pkgdir}/usr/bin/scru-openbox-pipemenu"
  find "${pkgdir}/" -type d -exec chmod 755 {} \;
}
