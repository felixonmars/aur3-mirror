# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=pydio-git
_pkgname=pydio
pkgver=6.0.2.r3.gd57e367
pkgrel=1
pkgdesc='PHP file sharing platform, formerly AjaXplorer.'
arch=('any')
url='http://pyd.io/'
license=('AGPL3')
depends=('php>=5.3' 'php-mcrypt>=5.3' 'php-gd>=5.3')
optdepends=('php-sqlite: Store your data in sqlite database'
            'libssh2: File management functionalities over SSH2 [access.sftp]'
            'smbclient: Browse a Samba Server [access.smb]'
            'imagemagick: View PDF and various images formats [editor.imagick]'
            'ghostscript: View PDF and various images formats [editor.imagick]'
            'subversion: Extract SVN informations from workspace'
            'php-libgit2-git: Keep tracks of modifications using a Git repo'
            'pear-http-oauth: Allows accessing a dropbox account'
            'php-ldap: Authentication datas are stored in an LDAP/AD directory'
            'pear-mail-mimedecode: Email reader wich supports eml format'
            'pear-http-webdavclient: Access a WebDAV server'
            'php-aws-sdk: Access an AWS server'
            'pecl-rsync: Use desktop sync client')
options=('!strip')
install="${_pkgname}.install"

source=("git+https://github.com/pydio/pydio-core.git"
        "bootstrap_context.php.patch"
        "example_nginx_vhost.conf"
        "example_nginx_vhost_ssl.conf"
        "nginx-drop.conf"
        "nginx-php.conf"
        "${_pkgname}.install")

sha512sums=('SKIP'
	    '28c5889110bd6f9b20908895f1f7ab10b6813d37acb4ca9439f065867e85d9c9d7c7c85377e5e73ca272cec05fb4f90865f8a5755186025c244459d08ed71b7d'
	    '1d49d2f9c9a8a239d7fbc6e6b252b6b811cc8ce9e7bd2809998f783752d63f77a26536e5fcad487e5e3511b490cd79688dd7221b24ad6ee7ee2a0d73f35fb8d7'
	    'b11a16b64b243a83f917a1b067b8a0132f8135bef5c12639ad684da20e482d3749cb781209696bd3b60aaf15135600d06a5d35217ad9e291c5b72488d2a1e61b'
	    'ab600ea682c07aaf2d4c59747845ade368a04e15274a52eed0843ce53cd5570efa91b64ed2200b3940b1dbc96d6019aafa97815c22c7d36237c8ee36b68c58fc'
	    '11737c73c2034129c08def42b1fd49b2bc4cc348d7af1c4b16d4bb31a8f013f100589135f430db5a895f1bd2f0c0abbb371635eaee7bf42a2b1ef5252f0beb53'
	    '7867bc04d9441190ae4413049030f9c91c066942627df307c52c9ac32edde860603121c866592a8405cf6c204e32e72446c382f58b9d51b353c9802d78b29aea')

pkgver() {
  cd "${SRCDEST}/${_pkgname}-core"
  git describe --long --tags | cut -d"-" -f"3-5" | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}-core/core/src"

  install -d "${pkgdir}/usr/share/webapps/pydio"
  cp -r *.php core phpunit plugins "${pkgdir}/usr/share/webapps/pydio/"

  install -d "${pkgdir}/etc/webapps/pydio"
  cp -r conf/* "${pkgdir}/etc/webapps/pydio/"
  ln -s "/etc/webapps/pydio" "${pkgdir}/usr/share/webapps/pydio/conf"

  install -d "${pkgdir}/var/lib/pydio"
  cp -r data/* "${pkgdir}/var/lib/pydio/"
  ln -s "/var/lib/pydio" "${pkgdir}/usr/share/webapps/pydio/data"
  chgrp -R 33 "${pkgdir}/var/lib/pydio"
  chmod -R 770 "${pkgdir}/var/lib/pydio"

  install -d "${pkgdir}/usr/share/doc/pydio"
  install -Dm644 "${srcdir}/example_nginx_vhost.conf" "${pkgdir}/usr/share/doc/pydio/"
  install -Dm644 "${srcdir}/example_nginx_vhost_ssl.conf" "${pkgdir}/usr/share/doc/pydio/"
  install -d "${pkgdir}/usr/share/doc/pydio/nginx-conf.d"
  install -Dm644 "${srcdir}/nginx-drop.conf" "${pkgdir}/usr/share/doc/pydio/nginx-conf.d/drop.conf"
  install -Dm644 "${srcdir}/nginx-php.conf" "${pkgdir}/usr/share/doc/pydio/nginx-conf.d/php.conf"
}
