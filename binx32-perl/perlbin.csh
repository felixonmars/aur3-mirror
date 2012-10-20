# Set path to perl scriptdirs if they exist
# https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_Scripts
# Added /usr/bin/*_perl-x32 dirs for scripts
# Remove /usr/libx32/perl5/*_perl/bin in next release

[ -d /usr/bin/site_perl-x32 ] && setenv PATH ${PATH}:/usr/bin/site_perl-x32
[ -d /usr/libx32/perl5/site_perl/bin ] && setenv PATH ${PATH}:/usr/libx32/perl5/site_perl/bin

[ -d /usr/bin/vendor_perl-x32 ] && setenv PATH ${PATH}:/usr/bin/vendor_perl-x32
[ -d /usr/libx32/perl5/vendor_perl/bin ] && setenv PATH ${PATH}:/usr/libx32/perl5/vendor_perl/bin

[ -d /usr/bin/core_perl-x32 ] && setenv PATH ${PATH}:/usr/bin/core_perl-x32

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2
