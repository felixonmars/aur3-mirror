# Maintainer: James An <james@jamesan.ca>

pkgname=()
pkgver='7.x'
pkgrel=1
pkgbase='aegir-platform'
pkgdesc='Drupal platforms for Aegir'
arch=('any')
url='https://www.drupal.org/project/project_distribution'
license=('GPL')
groups=('drupal')
depends=('aegir-hostmaster')

_PLATFORMS=(
    'drupal'
)

#declare -r _url_source='http://ftp.drupal.org/files/projects'
#declare -r _url_sufext='core.tar.gz'
#declare -r _url_base='https://www.drupal.org/project'
for _platform in ${_PLATFORMS[@]}; do
    _pkgver=$(drush rl ${_platform} --pipe | egrep '(Recommended|Supported)' | head -n 1 | cut -f2 -d,)
    pkgname[${#pkgname[@]}]="${pkgbase}-${_platform}"
    #source[${#source[@]}]="${_url_source}/${_platform}-${_pkgver}-${_url_sufext}"
    #md5sums[${#md5sums[@]}]="${_MD5SUMS[${_platform}]}"

    # instantiate platform-specific packaging function
    eval "package_${pkgbase}-${_platform}() {
        pkgver=${_pkgver/-/_}
        pkgdesc=\"Drupal platform for Aegir: ${_platform}\"
        url=\"https://www.drupal.org/project/${_platform}\"

        msg2 'Downloading platform'
        install -dm755 \"\${pkgdir}/usr/share/webapps\"
        install -dm755 \"\${pkgdir}/var/lib/aegir/platforms/${_platform}-\${pkgver}\"
        drush dl ${_platform} --yes --quiet --destination=\"\${pkgdir}/usr/share/webapps\"

        msg2 'Moving sites folder'
        mv \"\${pkgdir}/usr/share/webapps/${_platform}-\${pkgver}/sites\" \"\${pkgdir}/var/lib/aegir/platforms/${_platform}-\${pkgver}\"
        ln -s \"/var/lib/aegir/platforms/${_platform}-\${pkgver}/sites\" \"\${pkgdir}/usr/share/webapps/${_platform}-\${pkgver}/sites\"
        chown -R 170:170 \"\${pkgdir}/usr/share/webapps/${_platform}-\${pkgver}\"
        chown -R 170:170 \"\${pkgdir}/var/lib/aegir\"
    }"
done
