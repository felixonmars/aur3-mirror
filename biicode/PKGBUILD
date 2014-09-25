# Maintainer: Manu Sánchez (Manu343726) <Manu343726.public@gmail.com>

_version="1.7.2"
_version_label=${_version//./_}
_debname=""
pkgname=biicode
pkgver=$_version
pkgrel=1
pkgdesc="Simple C/C++ file-based dependency manager"
arch=('i686' 'x86_64')
url="http://www.biicode.com"
license=('unknown')
install=biicode.install
depends=('cmake>=2.8.12','zlib','glibc')
makedepends=('dpkg')

declare -A _package_32bit_sums=(["1.3.3"]="fd385f488eaf28182b99c52b9bb3e960"
                                ["1.4.1"]="167d08ab88d2de6bdb59629ffad9cfe2"
                                ["1.6"]="ef451f2f76b1a3d88ac52b06b4205bc4"
                                ["1.7.2"]="4f24ec99b737c2759b30d5dd4dd1ff18")

declare -A _package_64bit_sums=(["1.3.3"]="b0a2e4f2be5a11d995f550305cbe1569"
                                ["1.4.1"]="040c405c98b20803caa9bd8a56c2de95"
                                ["1.6"]="354602e2c05a818dc11da718f6e2ec64"
                                ["1.7.2"]="9b93fac2eda28e00f821b4181dbaca18")

case $CARCH in 
    ('i686')
        source=(.AURINFO "https://s3.amazonaws.com/biibinaries/release/${_version}/bii-ubuntu32_${_version_label}.deb")
        md5sums=(SKIP "${_package_32bit_sums[$_version]}")
        _debname="bii-ubuntu32_${_version_label}.deb"
    ;;
    ('x86_64')
        source=(.AURINFO "https://s3.amazonaws.com/biibinaries/release/${_version}/bii-ubuntu64_${_version_label}.deb")                                                                
        md5sums=(SKIP "${_package_64bit_sums[$_version]}")
        _debname="bii-ubuntu64_${_version_label}.deb"
esac

noextract=('${_debname}')

package()
{
    dpkg -i --ignore-depends=zlib1g,libc-bin "${srcdir}/${_debname}" 
}
