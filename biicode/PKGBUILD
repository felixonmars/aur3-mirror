# Maintainer: Manu Sánchez (Manu343726) <Manu343726.public@gmail.com>

_version="1.3.3"
_version_label=${_version//./_}

pkgname=biicode
pkgver=$_version
pkgrel=2
pkgdesc="Simple C/C++ file-based dependency manager"
arch=('i686' 'x86_64')
url="http://www.biicode.com"
license=('unknown')
install=biicode.install


case $CARCH in 
    ('i686')
        source=(.AURINFO "https://s3.amazonaws.com/biibinaries/release/${_version}/bii-ubuntu32_${_version_label}.deb")
        md5sums=(SKIP 'fd385f488eaf28182b99c52b9bb3e960')
    ;;
    ('x86_64')
        source=(.AURINFO "https://s3.amazonaws.com/biibinaries/release/${_version}/bii-ubuntu64_${_version_label}.deb")                                                                
        md5sums=(SKIP 'b0a2e4f2be5a11d995f550305cbe1569')
esac

package()
{
    echo "Extracting sources..."
    
    mkdir "${pkgdir}/data"
    tar -xvzf data.tar.gz -C "${pkgdir}/data"
    mkdir "${pkgdir}/control"                                                                                                                                                      
    tar -xvzf control.tar.gz -C "${pkgdir}/control"
    
    echo "Copying data..."

    cd "${pkgdir}/data/"
   
    
    # The original Debian package data (data.tar.gz) contains the /usr/share and /usr/lib/ directories
    # with the contents of the program, ready to be copied to the system /usr/ directory.
    cp ./usr/ / -v -r
     
    
    echo "Generating links..."

    cd "${pkgdir}/control"
    
    # Some links are added to make the binaries accesible
    ./postinst
}
