# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz@gmail.com>


pkgname=eclipse-m2eclipse-extra
pkgver=0.10.0
pkgrel=2
pkgdesc="Maven integration in Eclipse - Extras"
arch=('i686' 'x86_64')
url="http://m2eclipse.sonatype.org/"
license=('EPL')
depends=('eclipse-wtp-wst' 'eclipse-m2eclipse')
replaces=('eclipse-maven')
source=(components.url)
md5sums=('105248631540ad8457734fbf1922a287')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/maven/eclipse
  _weburl="http://m2eclipse.sonatype.org/sites/m2e-extras"
  
  cat components.url | while read _ctype _cname ; do
    case ${_ctype} in
      feature)
        msg "Downloading feature ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/features/${_cname}" || return 1
        install -dm755 ${_dest}/features/${_cname/.jar}
        cd ${_dest}/features/${_cname/.jar}
        jar xf ${srcdir}/${_cname} || return 1
        ;;
      plugin)
        msg "Downloading plugin ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/plugins/${_cname}" || return 1
        install -dm755 ${_dest}/plugins
        install -m644 ${srcdir}/${_cname} ${_dest}/plugins
        ;;
      unpack)
        msg "Downloading and unpacking plugin ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/plugins/${_cname}" || return 1
        install -dm755 ${_dest}/plugins/${_cname/.jar}
        cd ${_dest}/plugins/${_cname/.jar}
        jar xf ${srcdir}/${_cname} || return 1
        ;;
      *)
        error "Unknown jar type..."
        return 1
        ;;
    esac
  done
  
}

# vim:set ts=2 sw=2 et:
